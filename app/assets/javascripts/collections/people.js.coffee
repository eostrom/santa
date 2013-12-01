class Santa.Collections.People extends Backbone.Collection
  model: Santa.Models.Person
  url: '/people'
  comparator: 'name'

  santafy: ->
    @fetch
      url: @url + '/santafy'
      type: 'PUT'
      reset: true

  desantafy: ->
    @fetch
      url: @url + '/desantafy'
      type: 'PUT'
      reset: true
