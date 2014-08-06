#= require jquery
#= require handlebars
#= require ember
#= require ember-data

#= require bootstrap
#= require bootstrap/dist/js/bootstrap
#= require chroma
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require ./store
#= require_self
# For more information see: http://emberjs.com/guides/routing/

'use strict'
Headcount.Router.map ->
  this.resource( 'locations',{ path: '/' },  -> 
    this.route 'favorite'
    this.route 'popular'
    this.route 'hottest'
    this.route 'coolest'
  )
Headcount.LocationsRoute = Ember.Route.extend({
#  templateName: 'locations'
#  controllerName: 'headcount'
  model: ->
    this.store.find 'location'
})

Headcount.LocationsIndexRoute = Headcount.LocationsRoute.extend({
  templateName: 'location-list'
  controllerName: 'locations-list'
  sortProperties: ['name']
})
###
Headcount.LocationsFavoriteRoute = Headcount.LocationsIndexRoute.extend

Headcount.LocationsPopularRoute = Headcount.LocationsIndexRoute.extend({
	sortProperties: ['favcnt','name']
})

Headcount.LocationsHottestRoute = Headcount.LocationsIndexRoute.extend(
  sortFunction: (x,y)->
    return 0 if x.heat is y.heat && x.name is y.name
    return -1 if (x.heat < y.heat || (x.heat is y.heat && x.name < y.name))
    return 1 if (x.heat > y.heat || (x.heat is y.heat && x.name > y.name))
)

Headcount.LocationsCoolestRoute = Headcount.LocationsIndexRoute.extend(
  sortFunction: (x,y)->
    return 0 if x.heat is y.heat && x.name is y.name
    return -1 if (x.heat > y.heat || (x.heat is y.heat && x.name < y.name))
    return 1 if (x.heat < y.heat || (x.heat is y.heat && x.name > y.name))
)
###
