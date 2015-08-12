TenGigg.Views.PostForm = Backbone.View.extend({
  template: JST['posts/post_form'],

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.delegateEvents();
    return this;
  },

  // create: function (e) {
  //
  // }
});
