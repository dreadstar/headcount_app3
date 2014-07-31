###
#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
###
#= require_self
#= require chroma

window.Headcount = Ember.Application.create

Headcount.ApplicationAdapter = DS.LSAdapter.extend
  namespace: 'headcount-emberjs'
->
  'use strict'
  Headcount.Router.map ->
    this.resource( 
      'locations'
      { path: '/' }
      ->
        this.route 'favorite'
        this.route 'popular'
        this.route 'hottest'
        this.route 'coolest'
    )
  Headcount.HeadcountRoute = Ember.Route.extend({
    model: ->
      this.store.find 'location'
  })

  Headcount.LocationIndexRoute = Headcount.LocationRoute.extend({
    templateName: 'location-list'
    controllerName: 'location-list'
    sortProperties: ['name']
  })

  Headcount.LocationFavoriteRoute = Headcount.LocationIndexRoute.extend

  Headcount.LocationPopularRoute = Headcount.LocationIndexRoute.extend

  Headcount.LocationHottestRoute = Headcount.LocationIndexRoute.extend(
    sortFunction: (x,y)->
      return 0 if x.heat is y.heat && x.name is y.name
      return -1 if (x.heat < y.heat || (x.heat is y.heat && x.name < y.name))
      return 1 if (x.heat > y.heat || (x.heat is y.heat && x.name > y.name))
  )

  Headcount.LocationCoolestRoute = Headcount.LocationIndexRoute.extend(
    sortFunction: (x,y)->
      return 0 if x.heat is y.heat && x.name is y.name
      return -1 if (x.heat > y.heat || (x.heat is y.heat && x.name < y.name))
      return 1 if (x.heat < y.heat || (x.heat is y.heat && x.name > y.name))
  )



->
  'use strict';
  Headcount.LocationController = Ember.ObjectController.extend( {
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


->
  'use strict'

  Headcount.HeadcountController = Ember.ArrayController.extend({
    actions: {
      createLocation: ->
        title = this.get 'newTitle'
        .trim
        return if !title
        location = this.store.createRecord('location', {
        	title: title
        	isCompleted: false
        })
        location.save
        this.set 'newTitle',''
      clearCompleted: ->
        completed = this.get 'completed'
        completed.invoke 'deleteRecord'
        completed.invoke 'save'
    }

    remaining: Ember.computed.filterBy 'model', 'isCompleted', false 
    completed: Ember.computed.filterBy 'model', 'isCompleted', true 

    +computed length, completed.length
    allAreDone:  (key, value) ->
      if value?
        this.setEach 'isCompleted', value
        value
      else
        length = this.get 'length'
        completedLength = this.get 'completed.length'
        length > 0 && length is completedLength
    colors: ['black','blue','red']
    +computed colors
    colorMap: ->
      colors = this.get 'colors'
      chroma.scale colors
      .mode 'lab'
      .correctLightness false
  }) 


->
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

->
  'use strict'
  Ember.Handlebars.helper('pluralize',  (singular, count) ->
    /* From Ember-Data */
    inflector = Ember.Inflector.inflector
    count is 1 ? singular : inflector.pluralize singular 
  )



->
  'use strict'
  Headcount.Location = DS.Model.extend({
    id: DS.attr 'integer'
    name: DS.attr 'string'
    max_cap: DS.attr 'integer'
    current_state: DS.attr 'integer'
    +computed max_cap current_state
    heat: ->
      cs=this.get 'current_state'
      mc=this.get 'max_cap'
      mc= mc > 0 ? mc : 1
      ht=cs/mc
      ht = ht > 1 ? 1 : ht
    +computed heat
    heatcolor: ->
      hc=Ember.computed.alias 'controllers.headcount'
      ht=this.get 'heat'
      return hc.colorMap(ht).hex
  })


->
  'use strict'
  Headcount.LocationInputComponent = Ember.TextField.extend({
  ###
    focusOnInsert: ->
      this.$().val this.$().val()
      this.$().focus
    .on 'didInsertElement'
  ###
  })