/* global TenGigg */
TenGigg.Views.UserHeader = Backbone.View.extend({
  template: JST['users/user_header'],

  events: {
    'click a.overview': 'handleAllPosts',
    'click a.posts': 'handlePosts',
    'click a.comments': 'handleCommented',
    'click #profile': 'handleProfile'
  },

  render: function () {
    var content = this.template({
      user: this.model,
      posts: this.collection
    });
    this.$el.html(content);
    return this;
  },

  handleProfile: function () {
    var modal = new TenGigg.Views.UserEdit({
      model: this.model,
    });
    $('body').append(modal.$el);
    modal.render();
  },

  handleAllPosts: function () {
    this.collection.fetch({
      data: {
        posts: "all",
        user_id: this.model.id
      }
    });
  },

  handlePosts: function () {
    this.collection.fetch({
      data: {
        posts: "authored",
        user_id: this.model.id
      }
    });
  },

  handleCommented: function () {
    this.collection.fetch({
      data: {
        posts: "commented",
        user_id: this.model.id
      }
    });
  }

});
