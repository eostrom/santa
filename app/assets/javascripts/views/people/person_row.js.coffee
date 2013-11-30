class Santa.Views.PersonRow extends Backbone.View
  template: JST['people/row']
  tagName: 'tr'

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({person: @model}))

  events:
    'click .delete-person': 'deletePerson'

  deletePerson: (event) ->
    @model.destroy()
