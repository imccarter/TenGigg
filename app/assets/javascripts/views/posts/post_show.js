/* global TenGigg */

TenGigg.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['posts/post_show'],

  events: {
    "click .upvote": "toggleVote",
    "click .downvote": "toggleVote",
  },

  initialize: function () {
		this.addPostCommentForm();
		this.addCommentViews();
    this.listenTo(this.model, 'sync change', this.render);
    this.listenTo(this.model.vote(), 'sync change', this.render);
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addCommentView);
    this.listenTo(this.collection, 'remove', this.removeCommentView);
    this.listenTo(this.model, 'sync', this.changeCurrentUserComments);
  },

  changeCurrentUserComments: function () {
    this.collection.each(function (model) {
      if (model.author_id === TenGigg.CURRENT_USER.id) {
        var i = that.subviews.findIndex(function (subview) {
          return subview.model === model;
        });
        if (i !== -1) {
          that.subviews[i].model.set(model.attributes);
        }
      }
    }.bind(this));
  },

  render: function () {
    this.$el.html(this.template({ post: this.model, comments: this.collection }));
    this.attachSubviews();
    this.setButtons();
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
  },

  setButtons: function () {
    if (this.model.isVoted() && this.model.vote().get('vote_score') === 1) {
      this.$('.downvote').removeClass('active');
      this.$('.upvote').addClass('active');
    } else if (this.model.isVoted() && this.model.vote().get('vote_score') === -1) {
      this.$('.upvote').removeClass('active');
      this.$('.downvote').addClass('active');
    }
  },

  toggleVote: function (e) {
    var score;
    if ($(e.currentTarget).attr('name') === 'upvote') {
      score = 1;
    } else {
      score = -1;
    }
    if (this.model.isVoted()) {
      if (this.model.vote().get('vote_score') != score) {
        this.updateVote(score);
      } else {
        //do nothing
      }
    } else {
      this.handleVote(score);
    }
  },

  handleVote: function (score) {
    var that = this;
    this.model.vote().save({
      post_id: this.model.id,
      vote_score: score
    }, {
      success: function () {
        that.model.setScore(that.model.score() + score);
      }
    });
  },

  updateVote: function (score) {
    var that = this;
    this.model.vote().save({ vote_score: score }, 
    { success: function () {
        that.model.set('score', that.model.get('score') + (score * 2));
      }
    });
  }
});
