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
    this.listenTo(this.model.vote(), 'change add remove', this.render);
    this.listenTo(this.collection, "sync", this.render);
  },

  toggleVote: function (e) {
    // debugger;
    var score;
    if ($(e.currentTarget).attr('name') === 'upvote') {
      score = 1;
    } else {
      score = -1;
    }
    if (!this.model.isVoted()){
      this.handleVote(score);
    } else {
      this.model.vote().destroy();
      this.model.vote().clear();
    }
  },

  handleVote: function (score) {
    this.model.vote().destroy();
    this.model.vote().save({
      post_id: this.model.id,
      vote_score: score,
    });
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  }
});
