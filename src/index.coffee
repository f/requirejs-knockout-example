require ['knockout', 'index.app'], (ko, App)->
  ko.applyBindings @app = new App()