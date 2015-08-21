/* global TenGigg */
TenGigg.Views.UserHeader = Backbone.View.extend({
  template: JST['users/user_header'],

  events: {
    // 'click a.overview': 'handleAllPosts',
    // 'click a.posts': 'handlePosts',
    // 'click a.comments': 'handleCommented',
    'click #profile': 'handleProfile'
  },

  initialize: function () {
    this.listenTo(this.model, 'change sync', this.render);
  },

  render: function () {
    var content = this.template({
      user: this.model
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

  // handleAllPosts: function () {
  //   // this.collection.set(this.model.get('all_posts'));
  //   // this.collection.fetch();
  //
  //   this.model.allPosts();
  //
  //   // this.collection.fetch({
  //   //   data: {
  //   //     posts: "all",
  //   //     user_id: this.model.id
  //   //   }
  //   // });
  // },
  //
  // handlePosts: function () {
  //   this.collection.set(this.model.get('posts'));
  //   this.collection.fetch();
  //
  //   // this.model.posts();
  //
  //   // this.collection.fetch({
  //   //   data: {
  //   //     posts: "authored",
  //   //     user_id: this.model.id
  //   //   }
  //   // });
  // },
  //
  // handleCommented: function () {
  //   // debugger;
  //   this.collection.fetch();
  //   this.collection.set(this.model.get('commented_posts'));
  //
  //
  //   // this.model.commentedPosts();
  //
  //   // this.collection.fetch({
  //   //   data: {
  //   //     posts: "commented",
  //   //     user_id: this.model.id
  //   //   }
  //   // });
  // }

});
