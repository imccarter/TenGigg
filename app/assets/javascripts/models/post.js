/* global TenGigg */

TenGigg.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',

  isVoted: function () {
    return !this.vote().isNew();
  },

  setScore: function (value) {
    this._score = value;
  },

  score: function () {
    if (!this._score) {
      this._score = 0;
    }
    return this._score;
  },

  image: function () {
    if (!this._image) {
      this._image = new TenGigg.Models.Image();
    }
    return this._image;
  },

  vote: function () {
    if (!this._vote) {
      this._vote = new TenGigg.Models.Vote();
    }
    return this._vote;
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

    if (payload.vote) {
      this.vote().set(payload.vote[0]);
      delete payload.vote;
    }

    if (payload.categories) {
      this.categories().set(payload.categories);
      delete payload.categories;
    }

    if (payload.author) {
      this.author().set(payload.author);
      delete payload.author;
    }

    if (payload.comments) {
    	this.comments().set(payload.comments, { parse: true });
    	delete payload.comments;
    }

    if (payload.score) {
      this.setScore(payload.score);
      delete payload.score;
    }

    return payload;
  }
});
