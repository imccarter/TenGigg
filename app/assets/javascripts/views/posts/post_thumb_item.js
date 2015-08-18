/* global TenGigg */
TenGigg.Views.PostThumbItem = Backbone.View.extend({
  template: JST['posts/post_thumb_item'],

  render: function () {
    this.$el.html(this.template());
    return this;
  }
});
