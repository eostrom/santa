class Santa.Views.PeopleIndex extends Backbone.View
  el: 'body'
  template: JST['people/index']

  initialize: ->
    @render()

    # TODO: add/remove individual subviews instead of rerendering everything
    @collection.on 'add remove', @render

  render: =>
    @$el.html(this.template())
    $table = @$el.find('#people')

    @collection.map (person) ->
      subview = new Santa.Views.PersonRow(model: person)
      $table.append(subview.el)

    this

  events:
    'submit #add-person': 'addPerson'

  addPerson: (event) ->
    event.preventDefault()

    $name = $(event.target).find('[name=name]')
    name = $name.val()
    $name.val('')

    @collection.add({name: name}).save()
