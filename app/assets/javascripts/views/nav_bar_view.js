TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .recent': 'recentHandler',
    'click .navbar-brand': 'indexHandler'
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.categories = options.categories;
    this.listenTo(this.router, 'route', this.handleRoute);
    this.listenTo(this.categories, 'sync', this.render);
  },

  indexHandler: function () {
    this.collection.reOrder('popularity');
  },

  recentHandler: function () {
    this.collection.reOrder('created_at');
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.categories.each(function (category) {
      $('.categories > ul').append(
        "<li><a href=/" + category.escape('name') + "/posts>" +
        category.escape('name') + "</a></li>"
      );
    });
    return this;
  },

  logOut: function() {
    window.username = "Account";
    $.ajax({
      url: '/session',
      type: 'DELETE',
      success: function() {
        this.render();
      }.bind(this)
    });
  },

  handleRoute: function (routeName, params) {
    this.$el.find('.active').removeClass('active');
    this.$el.find('.' + routeName).addClass('active');
  }

});
