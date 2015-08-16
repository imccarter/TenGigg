TenGigg.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/post_show'],

  initialize: function () {
		this.collection = this.model.comments();
		this.addPostCommentForm();
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
  	var formView = new TenGigg.Views.CommentForm({ 
  		model: new TenGigg.Models.Comment,
  		collection: this.collection,
  		parent: this.model,
  		type: 'Post'
  	});
  	this.addSubview('.comments', formView);
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
