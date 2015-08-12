TenGigg.Collections.Posts = Backbone.Collection.extend({
  model: TenGigg.Models.Post,
  url: '/api/posts',

  initialize: function (models) {
  },

  // comparator: function (post) {
  //   return (post.get('popularity') * -1);
  // },

  reOrder: function (attr) {
    console.log("Reordering?");
    var models = this.sortBy(attr).reverse();
    this.set([]);
    this.set(models);
  },

  getOrFetch: function (id) {
    var post = this.get(id);
    var posts = this;
    if (!post) {
      post = new TenGigg.Models.Post({ id: id });
      post.fetch({
        success: function () {
          posts.add(post);
        }
      });
    } else {
      post.fetch();
    }
    return post;
  }

});
