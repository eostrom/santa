class Santa.Models.Gift extends Backbone.RelationalModel
  toJSON: =>
    gift:
      title: @get('title') || ''
      artist: @get('artist') || ''
