class Santa.Collections.People extends Backbone.Collection
  model: Santa.Models.Person
  url: '/people'

  santafy: ->
    @fetch
      url: @url + '/santafy'
      type: 'PUT'
      reset: true
