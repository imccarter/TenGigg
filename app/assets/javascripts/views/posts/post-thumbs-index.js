/* global TenGigg */

TenGigg.Views.PostThumbsIndex = Backbone.CompositeView.extend({
  template: JST['posts/post_thumbs_index'],


  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$sideEl;
    this.addThumbViews();
    this.listenTo(this.collection, 'add', this.addThumbView);
    this.listenTo(this.collection, 'remove', this.removeThumbView);
  },

  render: function () {
    this.$el.html(this.template());
    return this;
  },

  addThumbView: function (post) {
    var view = new TenGigg.Views.PostThumbItem({
      model: post
    });
    this.addSubview('.post-thumbs', view);
  },

  addThumbViews: function () {
    this.collection.each(this.addThumbView.bind(this));
  },

  removeThumbView: function (post) {
    this.removeModelSubview('.post-thumbs', post);
  }

});
