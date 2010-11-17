(function() {
  var BC;
  BC = {};
  BC.ContentScript = {
    record: function() {
      return chrome.extension.sendRequest({
        action: 'record',
        url: window.location.href
      }, function(data, status) {
        console.log(data);
        return console.log(status);
      });
    }
  };
  BC.ContentScript.record();
}).call(this);
