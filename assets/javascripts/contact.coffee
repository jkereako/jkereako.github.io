---
---
class ContactFormValidation
  constructor: (@form, @flashDiv) ->

    class Cookie
      # Class methods
      constructor: (@name, value, expiryInDays = 0) ->
        @expiry = ''
        if expiryInDays
          date = new Date()
          date.setTime date.getTime() + (expiryInDays * 24 * 60 * 60 * 1000)
          @expiry = date.toGMTString()

        @value = switch
          when typeof value is 'string' or typeof value is 'number' then value
          when typeof value is 'object' then JSON.stringify value

      @find = (name) ->
        return cookie for cookie in document.cookie.split ';' when !!~cookie.indexOf name

      # Public methods
      unserializedValue: =>
        cookieStr = Cookie.find @name

        if not cookieStr
          return false

        escapedValue = cookieStr
        .split('=')[1]
        unescapedValue = unescape escapedValue
        try
          JSON.parse unescapedValue
        catch
          unescapedValue

      save: =>
        document.cookie = "#{@name}=#{escape @value}; expires=#{@expiry}; path=/"

      del: =>
        document.cookie = "#{@name}=; expires=Thu, 01 Jan 1970 00:00:01 GMT; path="

    # Has the user already submitted a form?
    if Cookie.find 'state'
      $ @form
        .find 'button[type="submit"]'
        .prop 'disabled', true

      value = new Cookie 'state'
      .unserializedValue()

      autofill = (input, values) ->
        aValue = values[input.name]
        input.disabled = true
        input.value = aValue
        input

      autofill input, value.values for input in $ @form.find 'input, textarea'

      $ @flashDiv
      .removeClass 'alert-warning'
      .addClass 'alert-warning'
      $ @flashDiv
      .find '.message'
      .text "You've already sent me a message. I'll get back to you."
      $ @flashDiv
      .show 'slow'

      return true

    $ @form
      .find 'button[type="submit"]'
        .click (event) =>
          event.preventDefault()
          @submitButton = event.target
          @flashDiv.hide()

          results = (@markup input, @validate input for input in $ @form
            .find 'input, textarea')

          if false not in results
            $ @submitButton
            .prop 'disabled', true
            url = $ @form
            .attr 'action'
            serializedString = $ @form
            .serialize()
            serializedArray = $ @form
            .serializeArray()

            normalizedValues = {}
            normalize = (obj, node) ->
              obj[node.name] = node.value
              obj

            normalize normalizedValues, object for object in serializedArray

            @send url, serializedString, normalizedValues, @submitButton, @flashDiv

    @markup = (field, success)->
      parentDiv = field.parentElement
      $ parentDiv
      .removeClass 'has-feedback'
      .addClass 'has-feedback'

      if success
        $ field
        .next 'span.glyphicon-remove'
        .hide 'fast'
        $ parentDiv
        .removeClass 'has-error'

      else
        $ field
        .next 'span.glyphicon-remove'
        .show 'fast'
        $ parentDiv
        .removeClass 'has-error'
        .addClass 'has-error'

      success

    @validate = (field) ->
      retVal = true

      if field.value is ''
        if field.required
          retVal = false
      else
        if field.type is 'email'
          pattern = ///[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?///

          if not field.value.match pattern
            retVal = false
      retVal

    @send = (url, serializedString, normalizedArray, submitButton, flashDiv) ->
      $.ajax
        url: url
        data: serializedString
        method: 'POST'
        error: (jqXHR, textStatus, errorThrown) ->
          cookie = new Cookie 'state', state, 7
          cookie.save()
          message = switch
            when textStatus is 'abort' then 'The operation has been cancelled.'
            when textStatus is 'error' then 'Unknown error.'
            when textStatus is 'parsererror' then 'Failed parsing the response.'
            when textStatus is 'timeout' then 'The operation timed-out.'

          $ submitButton
          .prop 'disabled', false
          $ flashDiv
          .removeClass 'alert-danger'
          .addClass 'alert-danger'
          $ flashDiv
          .find '.title'
          .text 'Error'
          $ flashDiv
          .find '.message'
          .text message
        success: (data, textStatus, jqXHR) ->
          state =
            didContact:true
            dateContacted: new Date()
            values: normalizedArray

          cookie = new Cookie 'state', state, 7
          cookie.save()

          $ flashDiv
          .removeClass 'alert-success'
          .addClass 'alert-success'
          $ flashDiv
          .find '.title'
          .text 'Success!'
          $ flashDiv
          .find '.message'
          .text 'Message successfully sent.'
        complete: (jqXHR, textStatus) ->
          # Show the flash `<div>` and then hide it after 7 seconds
          $ flashDiv
          .show 'slow'
          .delay 7000
          .hide 'slow'

contactForm = new ContactFormValidation $('form'), $('#flash')
