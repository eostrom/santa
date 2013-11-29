class Santa.Routers.People extends Backbone.Router
  routes:
    '' : 'index'

  index: ->
    new Santa.Views.PeopleIndex
