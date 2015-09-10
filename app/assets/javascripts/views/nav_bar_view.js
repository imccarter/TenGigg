/* global TenGigg */

TenGigg.Views.NavBarView = Backbone.View.extend({
  template: JST['nav_bar'],

  events: {
    'click .sign-out': 'logOut',
    'click .navbar-brand': 'indexHandler',
    'click #compose': 'composePost',
    'input .search-input': 'enterSearchHandler',
    'click .search-input': 'enterSearchHandler',
    'blur .search-input': 'hideSearchHandler',
    'mousedown .srch-res': 'goToLink'
  },

  initialize: function (options) {
    this.router = options.router;
    this.$el = options.$navEl;
    this.listenTo(TenGigg.categories, 'sync', this.render);
    this.searchPosts = options.searchPosts;
  },
  
  goToLink: function (e) {
    Backbone.history.navigate($(e.currentTarget).attr('href'), { trigger: true });
  },

  hideSearchHandler: function () {
    $('ul.insta-search').css('display', 'none');
  },

  enterSearchHandler: function (e) {
    this.searchText = $(e.currentTarget).val();
    $(".insta-search").empty();

    var results = this.searchPosts.filter(function (model) {
      var pattern = new RegExp(this.searchText, "gi");
      return pattern.test(model.get("title"));
    }.bind(this));
    
    if (this.searchText === "") {
      $('ul.insta-search').css('display', 'none');
      $(e.currentTarget).parent().removeClass('active');
      return;
    }

    if (!($(e.currentTarget).parent().hasClass('active'))) {
      $('ul.insta-search').dropdown('toggle');
      $(e.currentTarget).parent().addClass('active');
    }


    if (results.length > 0) {
      $('ul.insta-search').css('display', 'block');
			$(".search-input").focus();
      results.splice(0, 10).forEach (function (post) {
        $(".insta-search").append("<li class='dropdown-item' class='srch-res'><a href='#posts/" + post.escape('id') + "' class='srch-res'>" + post.escape("title") + "</a></li>");
      }.bind(this));
    } else {
      $('ul.insta-search').css('display', 'none');
    }
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
