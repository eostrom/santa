class Santa.Models.Gift extends Backbone.RelationalModel
  toJSON: =>
    gift:
      title: @get('title') || ''
      artist: @get('artist') || ''
      giver_id: @get('giver').id
      recipient_id: @get('recipient').id
