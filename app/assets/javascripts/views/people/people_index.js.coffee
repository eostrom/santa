class Santa.Views.PeopleIndex extends Backbone.View
  el: 'body'
  template: JST['people/index']

  initialize: ->
    @render()

    # TODO: add/remove individual subviews instead of rerendering everything
    @collection.on 'add remove', @render
    @collection.on 'reset', @render

  render: =>
    @$el.html(this.template({people: @collection}))
    $table = @$el.find('#people')
    @$el.find('input[name=name]').focus()

    @collection.map (person) ->
      subview = new Santa.Views.PersonRow(model: person)
      $table.append(subview.el)

    this

  events:
    'submit #add-person': 'addPerson'
    'click #santafy': 'santafy'
    'click #desantafy': 'desantafy'

  addPerson: (event) ->
    event.preventDefault()

    $name = $(event.target).find('[name=name]')
    name = $name.val()
    $name.val('')

    @collection.add([{name: name}])[0].save()

  santafy: (event) ->
    @collection.santafy()

  desantafy: (event) ->
    @collection.desantafy()

