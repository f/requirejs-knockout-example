define (require)->

  Widget = require 'core/widget'

  class Carousel extends Widget

    constructor: (text, @increment)->
      @value = @observe text
      @on 'x', ->
        alert 1

    next: ->
      @value "#{@value()}#{@increment}"
      @emit 'x'