TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/index'],
  className: 'post-index',

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
    // this.collection.each(this.addPostView.bind(this));
    // this.listenTo(this.collection, 'add', this.addPostView);
  },

  render: function () {
    this.$el.html(this.template());
    this.eachSubview(function (subview) {
      subview.remove();
    });
    this.addPostViews();
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({ model: post });
    this.addSubview('.posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  }

});
