window.TenGigg = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    // alert('Hello from Backbone!');
    TenGigg.categories = new TenGigg.Collections.Categories();
    TenGigg.categories.fetch();

    var posts = new TenGigg.Collections.Posts();
    var router = new TenGigg.Routers.Router({
      $rootEl: $('#root'),
      posts: posts
    });
    var navbar = new TenGigg.Views.NavBarView({
      router: router,
      $navEl: $('#navbar'),
      collection: posts,
      categories: TenGigg.categories
    });
    navbar.render();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TenGigg.initialize();
});
