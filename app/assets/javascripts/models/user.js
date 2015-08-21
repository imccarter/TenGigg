/* global TenGigg */

TenGigg.Models.User = Backbone.Model.extend({
  urlRoot: 'api/users',

  posts: function () {
    if (!this._posts) {
      this._posts = new TenGigg.Collections.Posts();
    }
    return this._posts;
  },

  allPosts: function () {
    if (!this._allPosts) {
      this._allPosts = new TenGigg.Collections.Posts();
    }
    return this._allPosts;
  },

  commentedPosts: function () {
    if (!this._commentedPosts) {
      this._commentedPosts = new TenGigg.Collections.Posts();
    }
    return this._commentedPosts;
  },

  comments: function () {
    if (!this._comments) {
      this._comments = new TenGigg.Collections.Comments();
    }
    return this._comments;
  },

  image: function () {
    if (!this._image) {
      this._image = new TenGigg.Models.Image();
    }
    return this._image;
  },

  parse: function (payload) {

    if (payload.all_posts) {
      this.allPosts().set(payload.all_posts);
      // delete payload.all_posts;
    }

    if (payload.posts) {
      this.posts().set(payload.posts, { parse: true });
      // delete payload.posts;
    }

    if (payload.commented_posts) {
      this.commentedPosts().set(payload.commented_posts);
      // delete payload.commented_posts;
    }

    if (payload.comments) {
      this.comments().set(payload.comments);
      delete payload.comments;
    }

    if (payload.image) {
      this.image().set(payload.image, { parse: true });
      delete payload.image;
    }

    return payload;
  }
});
