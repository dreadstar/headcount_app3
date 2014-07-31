
'use strict';
Headcount.LocationController = Ember.ObjectController.extend({
  isEditing: false

  bufferedTitle: Ember.computed.oneWay 'title' 

  actions: {
    editLocation: ->
      this.set 'isEditing' true
      this.set 'bufferedTitle', bufferedTitle
      this.set 'isEditing', false
    cancelEditing: ->
      this.set 'bufferedTitle', this.get 'title' 
      this.set 'isEditing', false
    removeLocation: ->
      this.removeLocation
  }
  removeLocation: ->
    location = this.get 'model'
    location.deleteRecord
    location.save()
  +observer isCompleted
  saveWhenCompleted: ->
    this.get('model').save
})