/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
    'input .search-input': 'enterSearchHandler',
    'click .search-input': 'enterSearchHandler',
    'blur .search-input': 'delayHide',
    'mousedown .srch-res': 'goToLink'
    // 'click .search-div': 'enterSearchHandler',
    // 'toggle .insta-search': 'stopProp',
    // 'click .search-anchor': 'prevDef',
    // 'click .search-div': 'stopProp',
    // 'click .search-input': 'stopProp',
    // 'click' : 'stopPropClick'
  },

  goToLink: function (e) {
    console.log('click');
    $(e.currentTarget).click();
    debugger;
  },
  //search-div > search-anchor > search-input

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(TenGigg.categories, 'sync', this.render);
    this.searchPosts = options.searchPosts;
  },

  delayHide: function () {
    function hideSearchHandler () {
      $('ul.insta-search').css('display', 'none');
    }
    window.setTimeout(hideSearchHandler, 2000);
  },

  hideSearchHandler: function () {
    $('ul.insta-search').css('display', 'none');
  },

  enterSearchHandler: function (e) {
    this.searchText = $(e.currentTarget).val();
    // e.stopPropagation();
    // e.preventDefault();
    $(".insta-search").empty();
    // $(e.currentTarget).parent().attr('aria-expanded', "false");

    var results = this.searchPosts.filter(function (model) {
      var pattern = new RegExp(this.searchText, "gi");
      return pattern.test(model.get("title"));
    }.bind(this));

		// $(".search-input").focus();
    if (this.searchText === "") {
      // $('ul.insta-search').dropdown('toggle');
      $('ul.insta-search').css('display', 'none');
      // $(".search-input").focus();
      $(e.currentTarget).parent().removeClass('active');
      return;
    }

    if (!($(e.currentTarget).parent().hasClass('active'))) {
      $('ul.insta-search').dropdown('toggle');
    	// $(".search-input").focus();
      $(e.currentTarget).parent().addClass('active');
    }


    if (results.length > 0) {
      $('ul.insta-search').css('display', 'block');
			$(".search-input").focus();
      results.splice(0, 10).forEach (function (post) {
        $(".insta-search").append("<li class='dropdown-item' class='srch-res' style='font-size: 8px'><a href='#posts/" + post.escape('id') + "' class='srch-res'>" + post.escape("title") + "</a></li>");
      }.bind(this));
    } else {
      $('ul.insta-search').css('display', 'none');

      // $(e.currentTarget).parent().dropdown('toggle');
      // $(".search-input").focus();
      // $(e.currentTarget).parent().addClass('active');
    	// debugger;
      // $(e.currentTarget).parent().attr('aria-expanded', "false");
//       $(e.currentTarget).parent().dropdown('toggle'); //Still working on it...
//       $(e.currentTarget).parent().removeClass('active');
    }
  },

  exitSearchHandler: function (e) { //UNDER CONSTRUCTION...

  	// $('.search-anchor').dropdown('toggle');
//   	$('.search-anchor').removeClass('active');
//   	e.preventDefault();
//   	e.stopPropagation();
  },

  stopProp: function (e) {
    console.log("stopProp");

    e.stopPropagation();
  },

  prevDef: function (e) {
    console.log("prevDef");

  	e.preventDefault();
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
