class Santa.Models.Person extends Backbone.Model
  initialize: () ->
    @set('gift_recipient_names', []) unless @get('gift_recipient_names')

  needs_more_santas: () ->
    @get('gifts_received_count') < 3