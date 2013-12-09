class Santa.Views.PersonRow extends Backbone.View
  template: JST['people/row']
  tagName: 'tr'

  initialize: ->
    @render()

    @model.get('gifts_given').on('add remove', @render)
    @model.get('gifts_received').on('add remove', @render)

  render: =>
    @$el.html(this.template({person: @model}))

  events:
    'click .delete-person': 'deletePerson'
    'change .add-recipient': 'addRecipient'

  deletePerson: (event) ->
    @model.destroy()

  addRecipient: (event) ->
    id = @$el.find('.add-recipient').val()
    recipient = @model.collection.get(id)

    if recipient
      gift = new Santa.Models.Gift(recipient: recipient, giver: @model)
      gift.save()