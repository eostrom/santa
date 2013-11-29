class Santa.Views.PeopleIndex extends Backbone.View
  el: 'body'
  initialize: -> @render()
  template: JST['people/index']

  render: ->
    this.$el.html(this.template({people: @collection.models}))
    this
