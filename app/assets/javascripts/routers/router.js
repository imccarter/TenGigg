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
    ":category/posts": "category",
    "posts/:id": "postShow",
    "users/:id": "userShow"
  },

  index: function () {
    this.collection.fetch();
    var indexView = new TenGigg.Views.PostsIndex({
      collection: this.collection
    });
    this._swapView(indexView, this.$indexEl);
  },

  postShow: function (id) {
    var post = this.collection.getOrFetch(id);
    var comments = post.comments();
    var showView = new TenGigg.Views.PostShow({
      model: post,
      collection: comments
    });
    this._swapView(showView, this.$indexEl);
  },

  userShow: function (id) {
    var user = TenGigg.users.getOrFetch(id);
    var posts = user.posts();
    var comments = user.comments();
    var headerView = new TenGigg.Views.UserHeader({
      model: user,
      collection: posts,
      comments: comments
    });
    var showView = new TenGigg.Views.UserShow({
      model: user,
      collection: posts,
      comments: comments
    });
    this._swapView(showView, this.$indexEl);
    this.$headerEl.html(headerView.$el);
    headerView.render();
  },

  category: function (category) {
    var posts = new TenGigg.Collections.Posts();
    posts.fetch({
      data: { category: category }
    });
    var indexView = new TenGigg.Views.PostsIndex({ collection: posts });
    this._swapView(indexView, this.$indexEl);
  },

  _swapView: function (view, where) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    where.html(view.$el);
    view.render();
  },

});
