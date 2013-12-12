class Santa.Views.Recipient extends Backbone.View
  template: JST['people/recipient']
  tagName: 'td'

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({gift: @model}))

  events:
    'click .delete-recipient': 'deleteRecipient'

  deleteRecipient: (event) ->
    event.preventDefault()

    @model.destroy()
