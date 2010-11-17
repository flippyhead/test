(function() {
  var __bind = function(func, context) {
    return function(){ return func.apply(context, arguments); };
  };
  window.BC = {};
  window.BC.Background = {
    listen: function() {
      chrome.cookies.getAll({}, function(cookies) {
        return console.log(cookies);
      });
      return chrome.extension.onRequest.addListener(function(request, sender, callback) {
        return jQuery(document).ready(__bind(function($) {
          return $.ajax({
            url: "http://localhost.com:3000/record?url=" + request.url,
            success: function(data, status) {
              return callback(data, status);
            }
          });
        }, this));
      });
    }
  };
}).call(this);
