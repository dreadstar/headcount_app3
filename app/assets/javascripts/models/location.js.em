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