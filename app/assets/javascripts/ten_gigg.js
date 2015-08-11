window.TenGigg = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    new TenGigg.Routers.Router({
      $rootEl: $('#root'),
      posts: new TenGigg.Collections.Posts()
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TenGigg.initialize();
});
