/* global TenGigg */

TenGigg.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$headerEl = options.$headerEl;
    this.$sideEl = options.$sideEl;
    this.$indexEl = options.$indexEl;
    this.collection = options.posts;
  },

  routes: {
    "": "index",
    "recent": "recent",
    ":category/posts": "category",
    "profile": "profile",
    "posts/:id": "postShow",
    "users/:id": "userShow"
  },

  index: function () {
    this.headerView && this.headerView.remove();
    this.collection.fetch();
    var indexView = new TenGigg.Views.PostsIndex({
      collection: this.collection
    });
    this._swapView(indexView, this.$indexEl);
  },

  recent: function () {
    
  },

  postShow: function (id) {
    this.headerView && this.headerView.remove();
    var post = this.collection.getOrFetch(id);
    var comments = post.comments();
    var showView = new TenGigg.Views.PostShow({
      model: post,
      collection: comments
    });
    this._swapView(showView, this.$indexEl);
  },

  profile: function () {
    var user = TenGigg.users.getOrFetch(window.TenGigg.CURRENT_USER.id);
    var posts = user.posts();
    var comments = user.comments();
    this.headerView = new TenGigg.Views.UserHeader({
      model: user,
      collection: posts,
      comments: comments
    });
    var showView = new TenGigg.Views.UserShow({
      model: user,
      collection: posts,
      comments: comments
    });

    this.$indexEl.html(showView.$el);
    showView.render();

    this.$headerEl.html(this.headerView.$el);
    this.headerView.render();
  },

  userShow: function (id) {
    var otherUser = TenGigg.users.getOrFetch(id);
    var posts = otherUser.posts();
    var comments = otherUser.comments();
    //STILL OBVIOUSLY UNDER CONSTRUCTION...
  },

  category: function (category) {
    this.headerView && this.headerView.remove();
    var posts = new TenGigg.Collections.Posts();
    posts.fetch({
      data: { category: category }
    });
    var indexView = new TenGigg.Views.PostsIndex({ collection: posts });
    this._swapView(indexView, this.$indexEl);
  },

  _swapView: function (view, where) {
    this._currentView && this._currentView.remove();
    // this.$headerEl && this.$headerEl.remove();
    this._currentView = view;
    where.html(view.$el);
    view.render();
  },

});
