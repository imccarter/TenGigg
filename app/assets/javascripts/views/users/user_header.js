/* global TenGigg */
TenGigg.Views.UserHeader = Backbone.View.extend({
  template: JST['users/user_header'],

  events: {
    'click #profile': 'handleProfile',
    // 'click .filter': 'toggleActive'
  },

  initialize: function () {
    this.listenTo(this.model, 'change sync', this.render);
  },

  render: function () {
    var content = this.template({
      user: this.model
    });
    this.$el.html(content);
    return this;
  },

  // toggleActive: function (e) {
  //   $('.filter').each(function () {
  //     $(this).removeClass('active');
  //   });
  //   $(e.currentTarget).addClass('active');
  // },

  handleProfile: function () {
    var modal = new TenGigg.Views.UserEdit({
      model: this.model,
    });
    $('body').append(modal.$el);
    modal.render();
  },

});
