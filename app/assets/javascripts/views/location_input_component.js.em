
'use strict'
Headcount.LocationInputComponent = Ember.TextField.extend({
###
  focusOnInsert: ->
    this.$().val this.$().val()
    this.$().focus
  .on 'didInsertElement'
###
})