#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
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
# for more details see: http://emberjs.com/guides/application/
# window.HeadcountApp3 = Ember.Application.create()
window.Headcount = Ember.Application.create({
	LOG_TRANSITIONS: true
})

