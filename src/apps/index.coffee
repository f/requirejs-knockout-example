define (require)->

  App      = require 'core/app'
  Carousel = require 'carousel.widget'

  class IndexApp extends App
    
    constructor: ->
      @carousels = @observe [
        new Carousel('hey', 2)
        new Carousel('hoy', 3)
        new Carousel('selam', 5)
      ]
            
    addCarousel: ->
      @carousels.push new Carousel 'hehe', 3
