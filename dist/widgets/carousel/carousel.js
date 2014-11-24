var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(function(require) {
  var Carousel, Widget;
  Widget = require('core/widget');
  return Carousel = (function(_super) {
    __extends(Carousel, _super);

    function Carousel(text, increment) {
      this.increment = increment;
      this.value = this.observe(text);
      this.on('x', function() {
        return alert(1);
      });
    }

    Carousel.prototype.next = function() {
      this.value("" + (this.value()) + this.increment);
      return this.emit('x');
    };

    return Carousel;

  })(Widget);
});

//# sourceMappingURL=carousel.js.map
