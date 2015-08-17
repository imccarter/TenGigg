TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .recent': 'recentHandler',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost'
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(this.router, 'route', this.handleRoute);
    this.listenTo(TenGigg.categories, 'sync', this.render);
  },

  indexHandler: function () {
    this.collection.reOrder('popularity');
  },

  recentHandler: function () {
    // this.collection.sort({attr: 'created_at'});
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

  logOut: function() {
    $.ajax({
      url: '/session',
      type: 'DELETE',
      success: function() {
        window.TenGigg.CURRENT_USER.username = "Account";
        this.render();
      }.bind(this)
    });
  },

  handleRoute: function (routeName, params) {
    this.$el.find('.active').removeClass('active');
    this.$el.find('.' + routeName).addClass('active');
  }

});
