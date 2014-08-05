
'use strict';
Headcount.LocationController = Ember.ObjectController.extend({
#  isEditing: false

#  bufferedTitle: Ember.computed.oneWay 'title' 

  actions: {
    toggleFavorite: true
    moreInfo: true
  }
#  removeLocation: ->
#    location = this.get 'model'
#    location.deleteRecord
#    location.save()
#  +observer isCompleted
#  saveWhenCompleted: ->
#    this.get('model').save
})