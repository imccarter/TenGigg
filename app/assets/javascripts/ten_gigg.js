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
      $rootEl: $('#root'),
      posts: posts
    });
    var navbar = new TenGigg.Views.NavBarView({
      router: router,
      $navEl: $('#navbar'),
      collection: posts,
    });

    var sidePosts = new TenGigg.Collections.Posts();
    sidePosts.fetch({ url: 'api/posts/random' });

    var thumbIndex = new TenGigg.Views.PostThumbsIndex({
      collection: sidePosts,
      $sideEl: $('#sidebar')
    });
    // add sidebar, use its own collection
    // call collection.fetch({ url: "api/posts/random" })
    navbar.render();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TenGigg.initialize();
});
