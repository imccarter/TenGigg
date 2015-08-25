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
		this.$('.comment-error').empty();
  	if (!TenGigg.CURRENT_USER.id) {
  		this.$('.comment-error').append("You need to log in to comment!");
  	}
		e.preventDefault();
		var data = $(e.currentTarget).serializeJSON();
		this.model.set(data);
		this.model.set({
			commentable_id: this.model.get('commentable_id'),
			commentable_type: this.model.get('commentable_type')
		});
		this.model.save({}, {
			success: function () {
				this.model.author().set({
					id: window.TenGigg.CURRENT_USER.id,
					username: window.TenGigg.CURRENT_USER.username
				});
				this.collection.add(this.model);
			}.bind(this),
			error: function (XHR, response) {
				this.$('.comment-error').append(response.responseJSON.join(", "));
			}
		});
	}
});
