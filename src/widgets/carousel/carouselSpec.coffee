define (require)->
  
  Carousel = require 'carousel.widget'

  describe 'When a carousel created', ->

    beforeEach ->
      @carousel = new Carousel()
      @carouselNextSpy = jasmine.createSpy 'next'

      @carousel.on 'hey', @carouselNextSpy
      @carousel.emit 'hey'

    it 'should emit next', ->
      expect(@carouselNextSpy).toHaveBeenCalled()