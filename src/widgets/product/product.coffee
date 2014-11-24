define (require)->

  Widget = require 'core/widget'
  BuyNow = require 'buynow.widget'

  class Product extends Widget
    constructor: (text, @increment)->
      @value = ko.observable text

    buyNow: -> @value @value() + @increment