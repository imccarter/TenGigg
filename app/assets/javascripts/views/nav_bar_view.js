/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .recent': 'recentHandler',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(TenGigg.categories, 'sync', this.render);
  },

  indexHandler: function () {
    this.collection.reOrder('score');
  },

  recentHandler: function () {
    this.collection.reOrder('created_at');
  },

  composePost: function () {
    var modal = new TenGigg.Views.PostForm({
      model: new TenGigg.Models.Post(),
      collection: this.collection
    });
    $('body').append(modal.$el);
    modal.render();
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  logOut: function () {
    $.ajax({
      url: '/session',
      type: 'DELETE',
      success: function() {
        window.TenGigg.CURRENT_USER.username = "Account";
        this.render();
        window.location.replace('/');
        // Backbone.history.navigate('#', { trigger: true });
      }.bind(this)
    });
  },

});
