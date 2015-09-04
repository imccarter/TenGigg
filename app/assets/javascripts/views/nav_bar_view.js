/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
    'input .search': 'searchHandler',
    'focus .dropdown-toggle-search': 'preventDefault',
    'click .dropdown-toggle-search': 'preventDefault'

  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(TenGigg.categories, 'sync', this.render);
  },

  searchHandler: function (e) {
    this.searchText = $(e.currentTarget);
    debugger;
    var results = this.collection.filter(function (model) {
      var pattern = new RegExp(this.searchText, "gi");
      return pattern.test(model.escape("title"));
    }).bind(this).first(10);
  },

  preventDefault: function (e) {
    e.stopPropagation();
  },

  indexHandler: function () {
    this.collection.reOrder('score');
    $(document).scrollTop(0);
  },

  recentHandler: function () {
    this.collection.reOrder('created_at');
    $(document).scrollTop(0);
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
      }.bind(this)
    });
  },

});
