var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(function(require) {
  var BuyNow, Product, Widget;
  Widget = require('core/widget');
  BuyNow = require('buynow.widget');
  return Product = (function(_super) {
    __extends(Product, _super);

    function Product(text, increment) {
      this.increment = increment;
      this.value = ko.observable(text);
    }

    Product.prototype.buyNow = function() {
      return this.value(this.value() + this.increment);
    };

    return Product;

  })(Widget);
});

//# sourceMappingURL=product.js.map
