define(function(require) {
  var $, SmartObject, ko;
  ko = require('knockout');
  $ = require('jquery');
  return SmartObject = (function() {
    function SmartObject() {}

    SmartObject.prototype.observe = function(value) {
      var observer;
      observer = Array.isArray(value) ? 'observableArray' : 'observable';
      return ko[observer](value);
    };

    SmartObject.prototype.obj = $({});

    SmartObject.prototype.on = function() {
      var _ref;
      return (_ref = this.obj).on.apply(_ref, arguments);
    };

    SmartObject.prototype.off = function() {
      var _ref;
      return (_ref = this.obj).off.apply(_ref, arguments);
    };

    SmartObject.prototype.emit = function() {
      var _ref;
      return (_ref = this.obj).trigger.apply(_ref, arguments);
    };

    return SmartObject;

  })();
});

//# sourceMappingURL=smartobject.js.map
