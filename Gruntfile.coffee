module.exports = (grunt)->

  require('load-grunt-tasks') grunt,
    pattern: ['grunt-*', '!grunt-template-*']
  
  class GruntConfig

    src         : './src'
    dist        : './dist'

    clean       :
      dist      : ["<%= dist %>"]
      test      : ['_SpecRunner.html']

    coffee      :
      options   :
        bare    : yes
        sourceMap: yes
      app       :
        expand  : yes
        cwd     : "<%= src %>"
        src     : ['**/*.coffee']
        dest    : "<%= dist %>"
        ext     : '.js'
      test      :
        expand  : yes
        cwd     : "<%= src %>"
        src     : ['**/*Spec.coffee']
        dest    : "<%= dist %>"
        ext     : '.js'

    coffeelint  :
      app       : ["<%= src %>/**/*.coffee", 'Gruntfile.coffee']
      test      : ["<%= src %>/**/*Spec.coffee"]
      options   :
        no_interpolation_in_single_quotes:
          level : 'error'
        prefer_english_operator:
          level : 'error'

    cssmin      :
      app       :
        expand  : yes
        cwd     : "<%= dist %>"
        src     : ['*.css', '!*.min.css']
        dest    : "<%= dist %>"
        ext     : '.min.css'
    
    processhtml :
      dist      :
        files   :
          './index.html': ['index.dev.html']

    watch       :
      scripts   :
        files   : "<%= src %>/**/*.coffee",
        tasks   : ['scripts']

      styles    :
        files   : "<%= src %>/**/*.scss",
        tasks   : ['styles']

    constructor: ({pages})->
      @generateConfig page for page in pages

    generateConfig: (page)->
      for config, generator of @generators
        @[config] or= {}
        @[config][page] = generator page

    generators:
      sass: (page)->
        outputStyle: 'compressed'
        sourceMaps: true
        files: do ($={})->
          $["<%= dist %>/#{page}.css"] =
            "<%= src %>/#{page}.scss"
          $

      requirejs: (page)->
        options           :
          almond          : yes
          wrap            : yes
          generateSourceMaps: yes
          preserveLicenseComments: no
          mainConfigFile  : "<%= dist %>/config.js"
          name            : '../node_modules/almond/almond'
          include         : [page]
          baseUrl         : "<%= dist %>"
          optimize        : 'uglify2'
          out             : "<%= dist %>/#{page}.min.js"

      jasmine: (page)->
        src               : "<%= dist %>/#{page}.js"
        options           :
          keepRunner      : yes
          summary         : yes
          display         : 'short'
          specs           : "<%= dist %>/**/*Spec.js"
          template        : require('grunt-template-jasmine-requirejs')
          templateOptions :
            requireConfigFile: "<%= dist %>/config.js"

  grunt.initConfig new GruntConfig
    pages: [
      'index'
    ]

  # Custom Tasks

  grunt.registerTask 'scripts', [
    'coffeelint'
    'coffee'
    'requirejs'
  ]

  grunt.registerTask 'styles', [
    'sass'
    'cssmin'
  ]

  grunt.registerTask 'test', [
    'coffeelint:test'
    'coffee:test'
    'test-nocompile'
  ]

  grunt.registerTask 'test-nocompile', [
    'jasmine'
    'clean:test'
  ]

  grunt.registerTask 'default', [
    'clean'
    'coffeelint'
    'coffee'
    'sass'
    'requirejs'
    'processhtml'
    'test-nocompile'
  ]