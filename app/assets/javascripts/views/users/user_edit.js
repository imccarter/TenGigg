/* global TenGigg */

TenGigg.Views.UserEdit = Backbone.View.extend({
  template: JST['users/user_edit'],

  events: {
    'click .upload-button': 'upload',
    'submit form': 'updateProfile',
    'click #close': 'closeForm',
    'click .m-background': 'closeForm'
  },

  render: function () {
    var content = this.template({ user: this.model });

  }
});
