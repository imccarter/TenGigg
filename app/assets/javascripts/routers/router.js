/* global TenGigg */

TenGigg.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
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
    var indexView = new TenGigg.Views.PostsIndex({ collection: this.collection });
    this._swapView(indexView);
  },

  postShow: function (id) {
    var post = this.collection.getOrFetch(id);
    var comments = post.comments();
    var showView = new TenGigg.Views.PostShow({
      model: post,
      collection: comments
    });
    this._swapView(showView);
  },

  userShow: function (id) {
    var user = TenGigg.users.getOrFetch(id);
    var posts = user.posts();
    var comments = user.comments();
    var showView = new TenGigg.Views.UserShow({
      model: user,
      collection: posts,
      comments: comments
    });
    this._swapView(showView);
  },

  category: function (category) {
    var posts = new TenGigg.Collections.Posts();
    posts.fetch({
      data: { category: category }
    });
    var indexView = new TenGigg.Views.PostsIndex({ collection: posts });
    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }

});
