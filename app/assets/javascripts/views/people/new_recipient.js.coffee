class Santa.Views.NewRecipient extends Backbone.View
  template: JST['people/new_recipient']
  tagName: 'td'

  initialize: (options) ->
    @giver = options.giver

    @render()

  render: =>
    @$el.html(this.template())

  events:
    'change .add-recipient': 'addRecipient'

  addRecipient: (event) ->
    id = @$el.find('.add-recipient').val()
    recipient = @giver.collection.get(id)

    if recipient
      gift = new Santa.Models.Gift(recipient: recipient, giver: @giver)
      gift.save()
