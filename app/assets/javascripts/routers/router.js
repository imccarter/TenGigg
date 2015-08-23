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
    "profile(/:posts)": "profile",
    "posts/:id": "postShow",
    "users/:id(/:posts)": "userShow"
  },

  index: function () {
    this.headerView && this.headerView.remove();
    this.collection.fetch();
    var indexView = new TenGigg.Views.PostsIndex({
      collection: this.collection
    });
    this._swapView(indexView);
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
    this._swapView(showView);
  },

  profile: function (postsType) {
    this.userShow(window.TenGigg.CURRENT_USER.id, postsType);
  },

  userShow: function (id, postsType) {
    var user = TenGigg.users.getOrFetch(window.TenGigg.CURRENT_USER.id);

    var comments = user.comments();
    var posts = new TenGigg.Collections.Posts();
    posts.fetch({
      url: "api/posts/user_posts",
      data: {
        posts: postsType,
        user_id: id
      }
    });
    this.headerView = new TenGigg.Views.UserHeader({
      model: user
    });
    var showView = new TenGigg.Views.UserShow({
      model: user,
      collection: posts,
      comments: comments
    });
    
    this._currentView && this._currentView.remove();

    this.$indexEl.html(showView.$el);
    showView.render();

    this.$headerEl.html(this.headerView.$el);
    this.headerView.render();
  },

  category: function (category) {
    this.headerView && this.headerView.remove();
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
    this.$indexEl.html(view.$el);
    view.render();
  },

});
