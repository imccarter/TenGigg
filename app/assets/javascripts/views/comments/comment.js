TenGigg.Views.Comment = Backbone.View.extend({
  template: JST['comments/comment'],
  tagName: "li",
  className: "comment",

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.author(), 'change', this.render);
    this.listenTo(this.model.author().image(), 'all', this.render);
  },

  render: function () {
    var content = this.template({
      comment: this.model,
      author: this.model.author()
    });
    this.$el.html(content);
    return this;
  }
});
