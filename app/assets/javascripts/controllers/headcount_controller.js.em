#= require chroma

'use strict'

Headcount.LocationsController = Ember.ArrayController.extend({
  actions: {
#    createLocation: ->
#      title = this.get 'newTitle'
#      .trim
#      return if !title
#      location = this.store.createRecord('location', {
#      	title: title
#      	isCompleted: false
#      })
#      location.save
#      this.set 'newTitle',''
#    clearCompleted: ->
#      completed = this.get 'completed'
#      completed.invoke 'deleteRecord'
#      completed.invoke 'save'
    setRange: true
  }

#  remaining: Ember.computed.filterBy 'model', 'isCompleted', false 
#  completed: Ember.computed.filterBy 'model', 'isCompleted', true 

#  +computed length, completed.length
#  allAreDone:  (key, value) ->
#    if value?
#      this.setEach 'isCompleted', value
#      value
#    else
#      length = this.get 'length'
#      completedLength = this.get 'completed.length'
#      length > 0 && length is completedLength
  colors: ['black','blue','red']
  +computed colors
  colorMap: ->
    colors = this.get 'colors'
    chroma.scale(colors).mode('lab').correctLightness(false)
})