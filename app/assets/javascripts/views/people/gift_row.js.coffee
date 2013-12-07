class Santa.Views.GiftRow extends Backbone.View
  template: JST['people/gift_row']
  tagName: 'tr'

  initialize: ->
    @render()

  render: =>
    @$el.html(this.template({person: @model}))

    for gift in @model.get('gifts_received').models
      subview = new Santa.Views.Gift(model: gift)
      @$el.append(subview.el)
