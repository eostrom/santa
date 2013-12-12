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

    giver = @model.get('giver').get('name')
    recipient = @model.get('recipient').get('name')

    if (confirm("Really delete #{giver}'s gift to #{recipient}?"))
      @model.destroy()
