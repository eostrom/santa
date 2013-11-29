window.Santa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Santa.Routers.People

$(document).ready ->
  Santa.initialize()
