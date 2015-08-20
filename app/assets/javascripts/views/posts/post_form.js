/* global TenGigg */

TenGigg.Views.PostForm = Backbone.View.extend({
  template: JST['posts/post_form'],

  events: {
    'click .upload-button': 'upload',
    'submit form': 'savePost',
    'click #close': 'closeForm',
    'click .m-background': 'closeForm'
  },

  initialize: function () {
    this.image = new TenGigg.Models.Image();
    $(document).on('keyup', this.handleKey.bind(this));
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.delegateEvents();
    this.listenTo(TenGigg.categories, 'sync', this.render);
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

  upload: function (e) {
    e.preventDefault();
    var post = this.model;
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      var data = result[0];
      this.image.set({
        url: this.formatMainImage(data.url),
        thumbnail_url: this.formatThumbnail(data.thumbnail_url),
        width: data.width,
        height: data.height
      });
      this.image.save({}, {
        success: function (image) {
          post.set({image_id: image.get('id')});
          this.$('.thumb-container').append(
            "<img src='" + image.escape('thumbnail_url') + "' alt='thumb' />"
          );
        }.bind(this),
      });
    }.bind(this));
  },

  formatMainImage: function (url) {
    var formattedMain = url.split('/');
    for (var i = 0; i < formattedMain.length; i++) {
      if (formattedMain[i] === 'upload') {
        formattedMain.splice((i + 1), 0, 'w_550,h_550,c_fit');
      }
    }
    return formattedMain.join('/');
  },

  formatThumbnail: function (thumbUrl) {
    var formattedThumb = thumbUrl.split('/');
    for (var i = 0; i < formattedThumb.length; i++) {
      if (formattedThumb[i] === 'upload') {
        formattedThumb.splice((i + 1), 1, 'w_90,h_90,c_fill');
      }
    }
    return formattedThumb.join('/');
  },

  savePost: function(e) {
    e.preventDefault();
    var data = $(e.currentTarget).serializeJSON();

    this.model.set(data);

    this.model.save({}, {
      success: function () {
        this.collection.add(this.model);
        // Backbone.history.navigate("#", { trigger: true });
        // window.location = "/";
        this.remove();
      }.bind(this),
    });
  },
});
