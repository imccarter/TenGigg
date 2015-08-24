/* global TenGigg */

TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({
  template: JST['posts/main_index'],
  className: 'post-index',
	
	events: {
		"click .next-page": "scrollUp",
    "click .prev-page": "scrollUp"
	},
	
  initialize: function () {
    this.addPostViews();
    this.listenTo(this.collection, 'sync sort', this.render);
    this.listenTo(this.collection, 'add', this.addPostView);
    this.listenTo(this.collection, 'remove', this.removePostView);
  },

  render: function () {
    this.$el.html(this.template({
    	posts: this.collection,
    	page: this.collection.page
    }));
    this.attachSubviews();
    return this;
  },
  
  scrollUp: function () {
  	$(document).scrollTop(0);
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({
      model: post,
      collection: post.comments() //Check this...
    });
    this.addSubview('.posts', view);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.posts', post);
  },
});
