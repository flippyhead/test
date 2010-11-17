(function() {
  var __bind = function(func, context) {
    return function(){ return func.apply(context, arguments); };
  };
  window.BC = {};
  BC.Application = {
    init: function() {
      this.target = $('#liveFrame');
      return jQuery(document).ready(__bind(function($) {
        this.adjustWindowHeight();
        return this.broadcast();
      }, this));
    },
    adjustWindowHeight: function() {
      var targetHeight;
      targetHeight = $(window).height() - 32;
      return this.target.css({
        width: '100%',
        height: targetHeight + 'px'
      });
    },
    go: function(location) {
      return alert(location.href);
    },
    broadcast: function() {
      frames["liveFrame"].onload = function() {
        return alert('xxx');
      };
      return console.log(this.target);
    }
  };
}).call(this);
