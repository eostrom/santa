class Santa.Models.Person extends Backbone.RelationalModel
  relations: [
    {
      type: Backbone.HasMany
      key: 'gifts_given'
      relatedModel: 'Santa.Models.Gift'
      collectionType: 'Santa.Collections.Gifts'
      reverseRelation:
        key: 'giver'
    }

    {
      type: Backbone.HasMany
      key: 'gifts_received'
      relatedModel: 'Santa.Models.Gift'
      collectionType: 'Santa.Collections.Gifts'
      reverseRelation:
        key: 'recipient'
    }
  ]

  needs_more_santas: () ->
    @get('gifts_received').length < 3

Santa.Models.Person.setup()
