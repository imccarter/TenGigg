TenGigg.Collections.Comments = Backbone.Collection.extend({
  model: TenGigg.Models.Comment,
  url: 'api/comments',

  getOrFetch: function (id) {
    var comment = this.get(id);
    var comments = this;
    if (!comment) {
      comment = new TenGigg.Models.Comment({ id: id });
      comment.fetch({
        success: function () {
          comments.add(comment);
        }
      });
    } else {
      comment.fetch();
    }
    return comment;
  }
});
