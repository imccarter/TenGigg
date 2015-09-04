/* global TenGigg */

window.TenGigg = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    TenGigg.categories = new TenGigg.Collections.Categories();

    TenGigg.users = new TenGigg.Collections.Users();
    TenGigg.categories.fetch();
    TenGigg.users.fetch();

    var posts = new TenGigg.Collections.Posts();

    var searchPosts = new TenGigg.Collections.Posts();
    searchPosts.fetch({ url: '/api/posts/all_posts' });

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
      searchPosts: searchPosts
    });

    var sidePosts = new TenGigg.Collections.Posts();
    sidePosts.fetch({ url: '/api/posts/random' });

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
