/* global TenGigg */

TenGigg.Collections.Posts = Backbone.Collection.extend({
  model: TenGigg.Models.Post,
  url: '/api/posts',

  initialize: function (models) {
  },

  reOrder: function (attr) {
    var models = this.sortBy(attr).reverse();
    this.set([]);
    this.set(models);
  },

  // filter: function (attr) {
  //   var models = this.filter(function (post) {
  //     post
  //   });
  // },

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
