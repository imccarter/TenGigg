/* global TenGigg */

TenGigg.Views.PostIndexItem = Backbone.View.extend({
  template: JST['posts/indexItem'],
  tagName: "li",
  className: "post-index-item",

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  }
});
