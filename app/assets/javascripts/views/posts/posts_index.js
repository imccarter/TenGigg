TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/index'],
  className: 'post-index',

  initialize: function () {
    this.addPostViews();
    // this.addPostForm();
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
    var view = new TenGigg.Views.PostIndexItem({ model: post });
    this.addSubview('.posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.posts', post);
  }
});
