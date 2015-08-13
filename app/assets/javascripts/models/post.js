/* global TenGigg */

TenGigg.Models.Post = Backbone.Model.extend({
  urlRoot: '/api/posts',

  image: function () {
    if (!this._image) {
      this._image = new TenGigg.Models.Image();
    }
    return this._image;
  },

  parse: function (payload) {
    if (payload.image) {
      this.image().set(payload.image);
      delete payload.image;
    }
    return payload;
  }
});
