window.TenGigg = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    var posts = new TenGigg.Collections.Posts();
    var router = new TenGigg.Routers.Router({
      $rootEl: $('#root'),
      posts: posts
    });
    var navbar = new TenGigg.Views.NavBarView({
      router: router,
      $navEl: $('#navbar'),
      posts: posts
    });
    navbar.render();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TenGigg.initialize();
});
