class Santa.Models.Gift extends Backbone.RelationalModel
  initialize: ->
    @get('giver').on 'destroy', @giverDestroyed
    @get('recipient').on 'destroy', @recipientDestroyed

  toJSON: =>
    gift:
      title: @get('title') || ''
      artist: @get('artist') || ''
      giver_id: @get('giver').id
      recipient_id: @get('recipient').id

  giverDestroyed: =>
    @get('recipient').get('gifts_received').remove(this)

  recipientDestroyed: =>
    @get('giver').get('gifts_given').remove(this)