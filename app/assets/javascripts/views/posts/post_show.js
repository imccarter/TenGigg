TenGigg.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/post_show'],

  initialize: function () {
    // this.collection = this.model.comments();
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    this.$el.html(this.template({ post: this.model }));
    return this;
  }
});
