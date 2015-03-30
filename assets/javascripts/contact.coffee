---
---
class ContactFormValidation
  constructor: (@form, @flashDiv) ->
    $ @form
      .find 'button[type="submit"]'
        .click (event) =>
          event.preventDefault()

          results = (@markup input, @validate input for input in $ @form
            .find 'input, textarea')

          if false not in results
            url = $ @form
           				.attr 'action'
            data = $ @form
            				.serialize()
            @send url, data, flashDiv

    @markup = (field, success)->
      div = field.parentElement
      $ div
        .removeClass 'has-feedback'
        .addClass 'has-feedback'

      if success
        $ div
          .removeClass 'has-error'

      else
          $ div
            .removeClass 'has-error'
            .addClass 'has-error'

      success

    @validate = (field) ->
      retVal = true
      if field.value is ''
        retVal = false

      else if field.type is 'email'
        pattern = ///[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?///

        if field.value.match pattern
          retVal = true
        else
          retVal = false
      retVal

    @send = (url, data, flashDiv) ->
       $.ajax
          url: url
          data: data
          method: 'POST'
          error: (jqXHR, textStatus, errorThrown) ->
            $ flashDiv
              .find 'title'
              .text 'Error'
          success: (data, textStatus, jqXHR) ->
            $ flashDiv
              .find 'title'
              .text 'Success!'
          complete: (data, textStatus, jqXHR) ->
            $ flashDiv
              .find 'message'
              .text textStatus
            # Show the flash `<div>` and then hide it after 7 seconds
            $ flashDiv
              .toggle 'slow'
                .delay 7000
                  .toggle 'slow'

contactForm = new ContactFormValidation $('form'), $('#flash')
