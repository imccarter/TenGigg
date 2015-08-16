/* global TenGigg */

TenGigg.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',

  image: function () {
    if (!this._image) {
      this._image = new TenGigg.Models.Image();
    }
    return this._image;
  },

  categories: function () {
    if (!this._categories) {
      this._categories = new TenGigg.Collections.Categories();
    }
    return this._categories;
  },

  comments: function () {
    if (!this._comments) {
      this._comments = new TenGigg.Collections.Comments();
    }
    return this._comments;
  },

  author: function () {
    if (!this._author) {
      this._author = new TenGigg.Models.User();
    }
    return this._author;
  },

  parse: function (payload) {
    if (payload.image) {
      this.image().set(payload.image);
      delete payload.image;
    }

    if (payload.categories) {
      this.categories().set(payload.categories);
      delete payload.categories;
    }

    if (payload.user) {
      this.author().set(payload.user);
      delete payload.user;
    }
    
    if (payload.comments) {
    	this.comments().set(payload.comments);
    	delete payload.comments;
    }

    return payload;
  }
});
