
'use strict'
Headcount.LocationsListController = Ember.ArrayController.extend({
  needs: 'locations'
#  allLocations: Ember.computed.alias 'controllers.locations'
  itemController: 'location'
#  +computed allLocations.length, @each.isEditing
#  canToggle: ->
#    anyLocations = this.get 'allLocations.length'
#    isEditing = this.isAny 'isEditing'
#    anyLocations && !isEditing
})