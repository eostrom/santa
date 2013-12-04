window.Santa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    #window.people = new Santa.Collections.People
    #window.people.fetch(reset: true)

    new Santa.Views.PeopleIndex(collection: window.people)
    new Santa.Routers.People

$(document).ready ->
  Santa.initialize()
