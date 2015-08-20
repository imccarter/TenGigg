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
    this.listenTo(this.model.vote(), 'sync destroy', this.render);
    this.listenTo(this.collection, "sync", this.render);
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
    this.model.vote().save({
      vote_score: score
    }, {
      success: function () {
        that.model.setScore(that.model.score() + (score * 2));
      }
    });
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  }
});
