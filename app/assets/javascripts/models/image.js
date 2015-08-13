TenGigg.Models.Image = Backbone.Model.extend({
  urlRoot: '/api/images',

  resizedUrl: function () {
    var urlArr = this.escape('url').split('/');
    for (var i = 0; i < urlArr.length; i++) {
      if (urlArr[i] === 'upload') {
        urlArr.splice((i + 1), 0, 'w_650,h_650');
      }
    }
    return urlArr.join('/');
  }
});
