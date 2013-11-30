class Santa.Views.PeopleIndex extends Backbone.View
  el: 'body'
  template: JST['people/index']

  initialize: ->
    @render()

    @collection.on 'add remove', @render

  render: =>
    this.$el.html(this.template({people: @collection.models}))
    this

  events:
    'submit #add-person': 'addPerson'
    'click .delete-person': 'deletePerson'

  addPerson: (event) ->
    event.preventDefault()

    $name = $(event.target).find('[name=name]')
    name = $name.val()
    $name.val('')

    @collection.add({name: name}).save()

  deletePerson: (event) ->
    event.preventDefault()

    id = $(event.target).data('person-id')
    @collection.get(id).destroy()
