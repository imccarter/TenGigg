/* global TenGigg */

TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/main_index'],
  className: 'post-index',

  initialize: function () {
    this.addPostViews();
    this.addPostThumbIndex();
    this.listenTo(this.collection, 'sync sort', this.render);
    this.listenTo(this.collection, 'add', this.addPostView);
    this.listenTo(this.collection, 'remove', this.removePostView);
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({
      model: post,
      collection: post.comments() //Check this...
    });
    this.addSubview('.posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.posts', post);
  },

  addPostThumbIndex: function () {
    var view = new TenGigg.Views.PostThumbsIndex({
      collection: this.collection
    });
    this.addSubview('#thumb-index', view);
  }
});
