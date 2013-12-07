class Santa.Views.Gift extends Backbone.View
  template: JST['people/gift']
  tagName: 'td'

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({gift: @model}))

  events:
    'change [name=title]': 'changeTitle'
    'change [name=artist]': 'changeArtist'

  changeTitle: (event) ->
    @model.save(title: $(event.target).val())

  changeArtist: (event) ->
    @model.save(artist: $(event.target).val())
