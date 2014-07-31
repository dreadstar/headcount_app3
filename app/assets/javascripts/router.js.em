# For more information see: http://emberjs.com/guides/routing/
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

