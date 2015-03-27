---
---
$ 'button[type="submit"]'
  .click (event)->
    $ '.form-control'
      .each ->
        $(@.parentElement)
          .removeClass 'has-feedback'
          .addClass 'has-feedback'
        if this.value is ''
          $(@.parentElement)
            .removeClass 'has-error'
            .addClass 'has-error'
            event
              .preventDefault()
        else
            $(@.parentElement)
              .removeClass 'has-success'
              .addClass 'has-success'
          return
      return
