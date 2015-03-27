---
---
$ 'button[type="submit"]'
  .click (event)->
    $ '.form-control'
      .each ->
        $(this.parentElement)
          .removeClass 'has-feedback'
          .addClass 'has-feedback'
        if this.value is ''
          $(this.parentElement)
            .removeClass 'has-error'
            .addClass 'has-error'
            event
              .preventDefault()
        else
            $(this.parentElement)
              .removeClass 'has-success'
              .addClass 'has-success'
          return
      return
