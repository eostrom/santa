class Santa.Views.PeopleIndex extends Backbone.View
  el: 'body'
  template: JST['people/index']

  initialize: ->
    @render()

    @collection.on 'add', @render

  render: =>
    this.$el.html(this.template({people: @collection.models}))
    this

  events:
    'submit #add-person': 'addPerson'

  addPerson: (event) ->
    event.preventDefault()

    $name = $(event.target).find('[name=name]')
    name = $name.val()
    $name.val('')

    @collection.add({name: name}).save()
