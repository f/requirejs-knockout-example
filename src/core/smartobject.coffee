define (require)->

  ko = require 'knockout'
  $ = require 'jquery'

  class SmartObject

    observe: (value)->
      observer = if Array.isArray value then 'observableArray' else 'observable'
      ko[observer] value

    obj: $ {}

    on:   -> @obj.on arguments...
    off:  -> @obj.off arguments...
    emit: -> @obj.trigger arguments...
