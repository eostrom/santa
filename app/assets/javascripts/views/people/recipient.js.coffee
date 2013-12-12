class Santa.Views.Recipient extends Backbone.View
  template: JST['people/recipient']
  tagName: 'td'

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({gift: @model}))
