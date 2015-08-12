TenGigg.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.posts;
  },

  routes: {
    "": "index",
  },

  index: function () {
    this.collection.fetch();
    var indexView = new TenGigg.Views.PostsIndex({ collection: this.collection });
    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
