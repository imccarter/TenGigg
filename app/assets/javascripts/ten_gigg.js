/* global TenGigg */

window.TenGigg = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    TenGigg.categories = new TenGigg.Collections.Categories();

    //Is gathering all the users in a collection ok?
    TenGigg.users = new TenGigg.Collections.Users();
    TenGigg.categories.fetch();
    TenGigg.users.fetch();

    var posts = new TenGigg.Collections.Posts();

    var router = new TenGigg.Routers.Router({
      $indexEl: $('#index'),
      $sideEl: $('#sidebar'),
      $headerEl: $('#header'),
      posts: posts
    });
    var navbar = new TenGigg.Views.NavBarView({
      router: router,
      $navEl: $('#navbar'),
      collection: posts,
    });

    var sidePosts = new TenGigg.Collections.Posts();
    sidePosts.fetch({ url: 'api/posts/random' });

    var sidebar = new TenGigg.Views.PostThumbsIndex({
      router: router,
      collection: sidePosts,
      $sideEl: $('#sidebar')
    });

    navbar.render();
    sidebar.render();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TenGigg.initialize();
});
