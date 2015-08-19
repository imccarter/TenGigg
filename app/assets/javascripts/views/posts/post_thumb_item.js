/* global TenGigg */
TenGigg.Views.PostThumbItem = Backbone.View.extend({
  template: JST['posts/post_thumb_item'],
  tagName: "li",
  className: "post-thumb-item",

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    this.$el.html(this.template({ post: this.model }));
    return this;
  }
});
