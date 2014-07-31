#= require chroma

'use strict'
Headcount.LocationListController = Ember.ArrayController.extend({
  needs: ['headcount']
  allLocations: Ember.computed.alias 'controllers.headcount'
  itemController: 'location'
  +computed allLocations.length, @each.isEditing
  canToggle: ->
    anyLocations = this.get 'allLocations.length'
    isEditing = this.isAny 'isEditing'
    anyLocations && !isEditing
})