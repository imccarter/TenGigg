/* global TenGigg */
TenGigg.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/user_show'],

  initialize: function (options) {
    this.addPostViews();
    this.comments = options.comments;
    //collection is posts authored by user...?
  },

  render: function () {
    var content = this.template({
      user: this.model,
      posts: this.collection
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({
      model: post,
      collection: post.comments()
    });
    this.addSubview('.user-posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.user-posts', post);
  }

});
