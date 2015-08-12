TenGigg.Views.PostsIndex = Backbone.CompositeView.extend({

  template: JST['posts/index'],
  className: 'post-index',

  events: {
    'submit form': 'addPost'
  },

  initialize: function () {
    this.addPostViews();
    this.addPostForm();
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addPostView);
    this.listenTo(this.collection, 'remove', this.removePostView);
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addPostView: function (post) {
    var view = new TenGigg.Views.PostIndexItem({ model: post });
    this.addSubview('.posts', view);
  },

  addPost: function (e) {
    e.preventDefault();
    // debugger;
    var $target = $(e.currentTarget);
    var data = $target.serializeJSON();
    var model = new TenGigg.Models.Post();
    model.set(data);
    model.save({}, {
      success: function () {
        this.collection.add(model);
        window.location = "/";
        // Backbone.history.navigate("#/", { trigger: true });
      }.bind(this)
    });
  },

  addPostForm: function () {
    // var post = new TenGigg.Models.Post();
    var formView = new TenGigg.Views.PostForm({});
    this.addSubview('.post-form', formView);
    // make the form view, passing in an empty model
    // addSubview(formView);
  },

  addPostViews: function () {
    this.collection.each(this.addPostView.bind(this));
  },

  removePostView: function (post) {
    this.removeModelSubview('.posts', post);
  }
});
