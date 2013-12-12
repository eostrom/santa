class Santa.Views.PersonRow extends Backbone.View
  template: JST['people/row']
  tagName: 'tr'

  initialize: ->
    @render()

    @model.get('gifts_given').on('add remove', @render)
    @model.get('gifts_received').on('add remove', @render)

  render: =>
    @$el.html(this.template({person: @model}))

    for gift in @model.get('gifts_given').models
      subview = new Santa.Views.Recipient(model: gift)
      @$el.append(subview.el)

    subview = new Santa.Views.NewRecipient(giver: @model)
    @$el.append(subview.el)

  events:
    'click .delete-person': 'deletePerson'

  deletePerson: (event) ->
    @model.destroy()
