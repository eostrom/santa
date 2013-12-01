class Santa.Models.Person extends Backbone.Model
  initialize: () ->
    @set('gift_recipient_names', []) unless @get('gift_recipient_names')
