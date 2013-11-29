window.Santa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    people = new Santa.Collections.People [
      {name: 'Christian Lipski'}
      {name: 'Erik Ostrom'}
      {name: 'Kai Stewart'}
      {name: 'John Fremer III'}
      {name: 'Matt Brown'}
    ]

    new Santa.Views.PeopleIndex(collection: people)
    new Santa.Routers.People

$(document).ready ->
  Santa.initialize()
