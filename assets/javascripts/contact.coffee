---
---
class ContactFormValidation
  constructor: (@form, @flashDiv) ->
    $ form
      .find 'button[type="submit"]'
        .click (event)->
          event.preventDefault()

          retVal = false
          $ form
            .find 'form-control'
              .each (idx, obj) ->
                retVal = @.validate obj
                @.markup obj, retVal

          if retVal
            @.send form

  markup: (field, success)->
    $ field
      .removeClass 'has-feedback'
      .addClass 'has-feedback'

    if success
      $ field
        .removeClass 'has-error'
        .addClass 'has-error'

    else
        $ field
          .removeClass 'has-success'
          .addClass 'has-success'

  validate: (field)->
    if field.value is ''
      return false

    if field.type is 'email'
      pattern = ///[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?///

      if field.value.match pattern
         console.log "E-mail is valid"
      else
         console.log "E-mail is invalid"
    true

  send: (form)->
     $.ajax
        url: $ form.attr 'action'
        data: $ form.serialize()
        method: 'POST'
        error: (jqXHR, textStatus, errorThrown) ->
          $ @.flashDiv
            .text 'failure'
        success: (data, textStatus, jqXHR) ->
          $ @.flashDiv
            .text 'Success!'
