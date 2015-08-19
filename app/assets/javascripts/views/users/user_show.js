/* global TenGigg */
TenGigg.Views.UserShow = Backbone.CompositeView.extend({
  template: JST['users/user_show'],

  events: {
    'click a.overview': 'handleAllPosts',
    'click a.posts': 'handlePosts',
    'click a.comments': 'handleCommented'
  },

  initialize: function (options) {
    this.activePosts = new TenGigg.Collections.Posts(this.collection.models);
    this.addPostViews();
    this.comments = options.comments;
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addPostView);
    this.listenTo(this.collection, 'remove', this.removePostView);

    this.listenTo(this.collection, 'filter', this.setActivePosts);

  },

  render: function () {
    var content = this.template({
      user: this.model,
      posts: this.collection
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({
      model: post,
      collection: post.comments()
    });
    this.addSubview('.user-posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.user-posts', post);
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
