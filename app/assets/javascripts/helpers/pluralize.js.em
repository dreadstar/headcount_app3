
'use strict'
Ember.Handlebars.helper('pluralize',  (singular, count) ->
  /* From Ember-Data */
  inflector = Ember.Inflector.inflector
  count is 1 ? singular : inflector.pluralize singular 
)