var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(function(require) {
  var App, Carousel, IndexApp;
  App = require('core/app');
  Carousel = require('carousel.widget');
  return IndexApp = (function(_super) {
    __extends(IndexApp, _super);

    function IndexApp() {
      this.carousels = this.observe([new Carousel('hey', 2), new Carousel('hoy', 3), new Carousel('selam', 5)]);
    }

    IndexApp.prototype.addCarousel = function() {
      return this.carousels.push(new Carousel('hehe', 3));
    };

    return IndexApp;

  })(App);
});

//# sourceMappingURL=index.js.map
