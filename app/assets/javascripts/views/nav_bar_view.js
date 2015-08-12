TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut'
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.collection = options.posts;
    this.listenTo(this.router, 'route', this.handleRoute);
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },


  //FIX ME:
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
