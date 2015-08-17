/* global TenGigg */

TenGigg.Models.Comment = Backbone.Model.extend({
  urlRoot: 'api/comments',

  author: function () {
    if (!this._author) {
      this._author = new TenGigg.Models.User();
    }
    return this._author;
  },

  parse: function (payload) {
    if (payload.author) {
      this.author().set(payload.author);
      delete payload.author;
    }

    return payload;
  }
});
