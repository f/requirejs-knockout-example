define(function(require) {
  var Carousel;
  Carousel = require('carousel.widget');
  return describe('When a carousel created', function() {
    beforeEach(function() {
      this.carousel = new Carousel();
      this.carouselNextSpy = jasmine.createSpy('next');
      this.carousel.on('hey', this.carouselNextSpy);
      return this.carousel.emit('hey');
    });
    return it('should emit next', function() {
      return expect(this.carouselNextSpy).toHaveBeenCalled();
    });
  });
});

//# sourceMappingURL=carouselSpec.js.map
