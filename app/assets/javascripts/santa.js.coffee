window.Santa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    people = new Santa.Collections.People
    people.fetch()

    new Santa.Views.PeopleIndex(collection: people)
    new Santa.Routers.People

$(document).ready ->
  Santa.initialize()
