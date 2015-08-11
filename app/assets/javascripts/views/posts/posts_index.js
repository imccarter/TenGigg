TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/index'],

  initialize: function () {
    this.collection.each(this.addPostView.bind(this));
    this.listenTo(this.collection, 'add', this.addPostView);
  },

  render: function () {
    var content = this.template({ posts: this.collection });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({ model: post });
    this.addSubview('.posts', view);
  },

});
