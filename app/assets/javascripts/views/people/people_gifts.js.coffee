class Santa.Views.PeopleGifts extends Backbone.View
  el: 'body'
  template: JST['people/gifts']

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({people: @collection}))
    $table = @$el.find('#gifts')

    @collection.map (person) ->
      subview = new Santa.Views.GiftRow(model: person)
      $table.append(subview.el)

    this
