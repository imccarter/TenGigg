/* global TenGigg */

TenGigg.Collections.Users = Backbone.Collection.extend({
  url: '/api/users',

  model: TenGigg.Models.User,

  getOrFetch: function (id) {
    var user = this.get(id);
    var users = this;
    if (!user) {
      user = new TenGigg.Models.User({ id: id });
      user.fetch({
        success: function () {
          users.add(user);
        }
      });
    } else {
      user.fetch();
    }
    return user;
  }
});
