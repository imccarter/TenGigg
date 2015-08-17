/* global TenGigg */

TenGigg.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/post_show'],

  initialize: function () {
		this.addPostCommentForm();
		this.addCommentViews();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addCommentView);
    this.listenTo(this.collection, 'remove', this.removeCommentView);
  },

  render: function () {
    this.$el.html(this.template({ post: this.model, comments: this.collection }));
    this.attachSubviews();
    return this;
  },

  addPostCommentForm: function () {
    var newComment = new TenGigg.Models.Comment({
      commentable_id: this.model.id,
      commentable_type: "Post"
    });
  	var formView = new TenGigg.Views.CommentForm({
  		model: newComment,
  		collection: this.collection
  	});
  	this.addSubview('.comments', formView, true);
  },

  addCommentView: function (comment) {
    var view = new TenGigg.Views.Comment({ model: comment });
    this.addSubview('.comments', view);
  },

  addCommentViews: function () {
    this.collection.each(this.addCommentView.bind(this));
  },

  removeCommentView: function (comment) {
    this.removeModelSubview('.comments', comment);
  }
});
