TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/index'],
  className: 'post-index',

  events: {
    // 'submit form': 'addPost'
  },

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
  //
  // addPostForm: function () {
  //   var post = new TenGigg.Models.Post();
  //   var formView = new TenGigg.Views.PostForm({
  //     collection: this.collection,
  //     model: post
  //   });
  //   this.addSubview('.post-form', formView);
  // },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.posts', post);
  }
});
