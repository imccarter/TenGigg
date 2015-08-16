TenGigg.Views.CommentForm = Backbone.View.extend({
	template: JST['comments/comment_form'],
	
	events: {
		'submit form': 'addComment'
	},
	
	initialize: function (options) {
		this.parent = options.parent
		this.commentableType = options.type
	},
	
	render: function () {
		var content = this.template({ comment: this.model });
		this.$el.html(content);
		return this;
	},
	
	addComment: function (e) {
		e.preventDefault();
		var data = $(e.currentTarget).serializeJSON();
		this.model.set(data);
		debugger;
		this.model.set({ 
			commentable_id: this.parent.get('id'),
			commentable_type: this.commentableType
		});
		this.model.save({}, {
			success: function () {
				console.log("adding a comment!")
				this.collection.add(this.model);
			}.bind(this),
		});
	}
});