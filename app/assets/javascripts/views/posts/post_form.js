TenGigg.Views.PostForm = Backbone.View.extend({
  template: JST['posts/post_form'],

  initialize: function () {
    this.image = new TenGigg.Models.Image();
    $(document).on('keyup', this.handleKey.bind(this));
  },

  events: {
    'click .upload-button': 'upload',
    'submit form': 'savePost',
    'click #close': 'closeForm',
    'click .m-background': 'closeForm'
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
        url: data.url,
        thumbnail_url: data.thumbnail_url,
        width: data.width,
        height: data.height
      });
      this.image.save({}, {
        success: function (image) {
          post.set({image_id: image.get('id')});
          // POSSIBLY REFACTOR INSERTING THE THUMB PIC???
          $('.thumb-container').append(
            "<img src='" + image.escape('thumbnail_url') + "' alt='' />"
          );
        }
      });
    }.bind(this));
  },

  savePost: function(e) {
    e.preventDefault();
    var data = $(e.currentTarget).serializeJSON();
    var image = this.image;
    //I guess this next line is unnecessary?
    // this.model.set({ image_id: image.get('id') });
    this.model.set(data);


    this.model.save({}, {
      success: function () {
        this.collection.add(this.model);
        // Backbone.history.navigate("#", { trigger: true });
        window.location = "/";
        this.remove();
      }.bind(this),
    });
  },
});
