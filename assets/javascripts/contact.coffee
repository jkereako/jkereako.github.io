---
---
class ContactFormValidation
  constructor: (@form, @flashDiv) ->
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
            data = $ @form
            				.serialize()
            @send url, data, @submitButton, @flashDiv

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

    @send = (url, data, submitButton, flashDiv) ->
       $.ajax
          url: url
          data: data
          method: 'POST'
          error: (jqXHR, textStatus, errorThrown) ->
            $ submitButton
            	.prop 'disabled', false
            $ flashDiv
              .removeClass 'alert-danger'
              .addClass 'alert-danger'
            $ flashDiv
              .find '.title'
              .text 'Error'
          success: (data, textStatus, jqXHR) ->
            $ flashDiv
              .removeClass 'alert-success'
              .addClass 'alert-success'
            $ flashDiv
              .find '.title'
              .text 'Success!'
          complete: (data, textStatus, jqXHR) ->
            $ flashDiv
              .find '.message'
              .text textStatus
            # Show the flash `<div>` and then hide it after 7 seconds
            $ flashDiv
              .show 'slow'
                .delay 7000
                  .hide 'slow'

contactForm = new ContactFormValidation $('form'), $('#flash')
