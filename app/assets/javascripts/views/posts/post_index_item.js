/* global TenGigg */

TenGigg.Views.PostIndexItem = Backbone.View.extend({
  template: JST['posts/index_item'],
  tagName: "li",
  className: "post-index-item",

  events: {
    "click .upvote": "toggleVote",
    "click .downvote": "toggleVote"
  },

  initialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
    this.listenTo(this.model.vote(), 'sync change', this.render);
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.setButtons();
    return this;
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
  	this.$('.vote-error').empty();
  	if (!TenGigg.CURRENT_USER.id) {
  		this.$('.vote-error').append("You need to log in to vote!");
  		return;
  	}
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
        that.model.set('score', that.model.get('score') + score);
      }
    });
  },

  updateVote: function (score) {
    var that = this;
    this.model.vote().save({ vote_score: score }, {
      success: function () {
        that.model.set('score', that.model.get('score') + (score * 2));
      }
    });
  }
});
