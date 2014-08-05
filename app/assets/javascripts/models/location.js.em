
'use strict'
Headcount.Location = DS.Model.extend({
#  id: DS.attr 'integer'
  name: DS.attr 'string'
  maxCap: DS.attr 'number'
  currentState: DS.attr 'number'
  yelpUrl: DS.attr 'string'
  siteUrl: DS.attr 'string'
  fanscnt: DS.attr 'number'
###
  +computed max_cap current_state
  heat: ->
    cs=this.get 'current_state'
    mc=this.get 'max_cap'
    if mc < 1 then  mc = 1
    ht=cs/mc
    if ht > 1 then ht = 1
    return ht
  +computed heat
  heatcolor: ->
    hc=Ember.computed.alias 'controllers.locations'
    ht=this.get 'heat'
    return hc.colorMap(ht).hex
###
})