/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
    'input .search-input': 'searchHandler',
    // 'focus .dropdown-toggle-search': 'stopProp',
    'click .search-anchor': 'stopProp',
    // 'click .dropdown-toggle-search': 'stopProp',
    // 'blur .dropdown-toggle-search' : 'stopProp'
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(TenGigg.categories, 'sync', this.render);
    this.searchPosts = options.searchPosts;
  },

  searchHandler: function (e) {
    this.searchText = $(e.currentTarget).val();

    $(".insta-search").empty();
    $(e.currentTarget).parent().attr('aria-expanded', "false");

    var results = this.searchPosts.filter(function (model) {
      var pattern = new RegExp(this.searchText, "gi");
      return pattern.test(model.get("title"));
    }.bind(this));

    if (results.length > 0) {
      $(e.currentTarget).parent().attr('aria-expanded', true); //trigger dropdown!
      debugger;
      results.splice(0, 10).forEach (function (post) {
        $(".insta-search").append("<li class='dropdown-item' style='font-size: 8px'>" + post.escape("title") + "</li>");
      }.bind(this));
    } else {
      $(e.currentTarget).parent().attr('aria-expanded', "false");
    }
  },

  stopProp: function (e) {
    // debugger;
    e.stopPropagation();
    e.preventDefault();
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
