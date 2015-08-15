TenGigg.Views.Comment = Backbone.View.extend({
  template: JST['comments/comment'],
  tagName: "li",
  className: "comment",

  render: function () {
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  }
});
