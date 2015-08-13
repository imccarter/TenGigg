TenGigg.Views.PostForm = Backbone.View.extend({
  template: JST['posts/post_form'],

  event: {
    'click .upload-button': 'upload'
  },

  render: function () {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.delegateEvents();
    return this;
  },

  upload: function (e) {
    // var image = new TenGigg.Models.Image();
    // e.preventDefault();
    // cloudinary.openUploadWidget(CLOUDINARY_OPTION, function(error, result) {
    //   var data = result[0]
    //   image.set({ url: data.url})
//
    // })
  }
});
