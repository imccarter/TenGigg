/* global TenGigg */
TenGigg.Collections.Votes = Backbone.Collection.extend({
  url: '/api/votes',
  model: TenGigg.Models.Vote,
});
