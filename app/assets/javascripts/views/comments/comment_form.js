/* global TenGigg */

TenGigg.Views.CommentForm = Backbone.View.extend({
	template: JST['comments/comment_form'],

	events: {
		'submit form': 'addComment'
	},

	initialize: function () {
		this.listenTo(this.collection, 'add', this.resetForm);
	},

	render: function () {
		var content = this.template({ comment: this.model });
		this.$el.html(content);
		return this;
	},

	resetForm: function () {
		var newComment = new TenGigg.Models.Comment({
      commentable_id: this.model.get('commentable_id'),
      commentable_type: "Post"
    });
		this.model = newComment;
		this.render();
	},

	addComment: function (e) {
		e.preventDefault();
		var data = $(e.currentTarget).serializeJSON();
		this.model.set(data);
		this.model.set({
			commentable_id: this.model.get('commentable_id'),
			commentable_type: this.model.get('commentable_type')
			// author_id: window.TenGigg.CURRENT_USER.id
		});
		this.model.save({}, {
			success: function () {
				this.model.author().set({
					id: window.TenGigg.CURRENT_USER.id,
					username: window.TenGigg.CURRENT_USER.username
				});
				this.collection.add(this.model);
			}.bind(this),
		});
	}
});
