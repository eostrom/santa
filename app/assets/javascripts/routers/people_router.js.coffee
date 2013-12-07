class Santa.Routers.People extends Backbone.Router
  routes:
    '' : 'index'
    'gifts' : 'gifts'

  index: ->
    new Santa.Views.PeopleIndex(collection: window.people)

  gifts: ->
    new Santa.Views.PeopleGifts(collection: window.people)
