/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
    'input .search-input': 'searchHandler',
    'focus .dropdown-toggle-search': 'stopProp',
    'blur .search-anchor': 'handleDropdown',
    'click .search-anchor': 'prevDef',
    'click .search-anchor': 'stopProp'
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
		$(".search-input").focus();
    
    if (!($(e.currentTarget).parent().hasClass('active'))) {
    	$(".search-input").focus();
      $(e.currentTarget).parent().dropdown('toggle');
      $(e.currentTarget).parent().addClass('active');
    }


    if (results.length > 0) {
			$(".search-input").focus();
      results.splice(0, 10).forEach (function (post) {
        $(".insta-search").append("<li class='dropdown-item' style='font-size: 8px'>" + post.escape("title") + "</li>");
      }.bind(this));
    } else {
    	debugger;
      $(e.currentTarget).parent().attr('aria-expanded', "false");
//       $(e.currentTarget).parent().dropdown('toggle'); //Still working on it...
//       $(e.currentTarget).parent().removeClass('active');
    }
  },
  
  handleDropdown: function (e) { //UNDER CONSTRUCTION...
//   	debugger;
//   	$('.search-anchor').dropdown('toggle');
//   	$('.search-anchor').removeClass('active');
//   	e.preventDefault();
//   	e.stopPropagation();
  },

  stopProp: function (e) {
    e.stopPropagation();
  },
  
  prevDef: function (e) {
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
