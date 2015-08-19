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

  setActivePosts: function () {
    debugger;

    this.subviews('.user-posts').each(function (view) {
      // this.removeSubview('.user-posts', view);
      view.remove();
    }.bind(this));
    this.subviews()['.user-posts'] = _([]);

    this.activePosts.forEach(function (post) {
      this.addPostView(post);
    }.bind(this));

    this.render();
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

    // this.activePosts.set(this.collection.models);
    // this.collection.trigger('filter');
  },

  handlePosts: function () {
    this.collection.fetch({
      data: {
        posts: "authored",
        user_id: this.model.id
      }
    });
    // this.activePosts.set(
    //   this.collection.where({ author_id: this.model.get('id') })
    // );
    // this.collection.trigger('filter');
  },

  handleCommented: function () {
    this.collection.fetch({
      data: {
        posts: "commented",
        user_id: this.model.id
      }
    });

    // this.activePosts.reset();
    // this.comments.each(function (cmt) {
    //   this.activePosts.push(this.collection.where({ id: cmt.get('commentable_id') }));
    // });
    // this.collection.trigger('filter');
  }
});
