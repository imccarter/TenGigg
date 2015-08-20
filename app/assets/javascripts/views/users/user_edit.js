/* global TenGigg */

TenGigg.Views.UserEdit = Backbone.View.extend({
  template: JST['users/user_edit'],

  events: {
    'click .upload-button': 'upload',
    'submit form': 'updateProfile',
    'click #close': 'closeForm',
    'click .m-background': 'closeForm'
  },

  initialize: function () {
    this.image = this.model.image();
    $(document).on('keyup', this.handleKey.bind(this));
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    this.delegateEvents();
    return this;
  },

  handleKey: function (e) {
    if (e.keyCode === 27) {
      this.remove();
    }
  },

  closeForm: function (e) {
    e.preventDefault();
    this.remove();
  },

  updateProfile: function (e) {
    e.preventDefault();
    var data = $(e.currentTarget).serializeJSON();

    this.model.set(data);
    this.model.set({ image_id: this.image.get('id') });
    this.model.save({}, {
      success: function () {

        this.remove();
      }.bind(this)
    });
  },

  upload: function (e) {
    e.preventDefault();
    var user = this.model;
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      if (result) {
        var data = result[0];
        this.image.set({
          url: this.formatProfilePic(data.url),
          thumbnail_url: this.formatCommentPic(data.thumbnail_url),
          width: data.width,
          height: data.height
        });
        this.image.save({}, {
          success: function (image) {
            this.$('.thumb-container').append(
              "<img src='" + image.escape('thumbnail_url') + "' alt='thumb' />"
            );
          }.bind(this),
        });
      } else {
        //NOTHING HAPPENS, ADD ERROR?
      }
    }.bind(this));
  },

  formatProfilePic: function (url) {
    var formattedMain = url.split('/');
    for (var i = 0; i < formattedMain.length; i++) {
      if (formattedMain[i] === 'upload') {
        formattedMain.splice((i + 1), 0, 'w_150,h_150,c_fill');
      }
    }
    return formattedMain.join('/');
  },

  formatCommentPic: function (thumbUrl) {
    var formattedThumb = thumbUrl.split('/');
    for (var i = 0; i < formattedThumb.length; i++) {
      if (formattedThumb[i] === 'upload') {
        formattedThumb.splice((i + 1), 1, 'w_75,h_75,c_fill');
      }
    }
    return formattedThumb.join('/');
  },

});
