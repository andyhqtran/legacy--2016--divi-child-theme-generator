
'use strict'

module.exports = (grunt) ->

  require('time-grunt')(grunt)
  require('jit-grunt')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    # Connect Task
    connect:
      server:
        options:
          port: 3000
          base: ['public', '.build']
          livereload: true
          open:
            target: 'http://localhost:3000'
            appName: 'Google Chrome'

    # Jade Task
    jade:
      options:
        pretty: true
        data: (dest, src) ->
          return require('./src/jade/config.json')

      dev:
        expand: true
        cwd: 'src/jade/views'
        src: ['**/*.jade']
        dest: '.build'
        ext: '.html'

    # Wiredep Task
    wiredep:
      dev:
        options:
          ignorePath: '.build/'
          dependencies: true
          devDependencies: true
        src: ['**/*.jade']

    # Sass Task
    sass:
      options:
        style: 'expanded'
        precision: 10
        update: true

      dev:
        expand: true
        cwd: 'src/scss'
        src: ['*.{scss,sass}', '!_*.{scss,sass}']
        dest: '.build/css'
        ext: '.css'

    # PostCSS Task
    postcss:
      dev:
        options:
          map: true
          processors: [
            require('autoprefixer')({
              browsers: 'last 6 versions'
            })
          ]
        src: ['.build/**/*.css']

    # Coffee Task
    coffee:
      dev:
        expand: true
        base: true
        cwd: 'src/coffee'
        src: ['*.coffee']
        dest: '.build/js'
        ext: '.js'

    # Coffeelint Task
    coffeelint:
      options:
        configFile: 'src/.coffeelint.json'

      dev:
        files:
          src: ['src/**/*.coffee', 'Gruntfile.coffee']

    # Notify Task
    notify:
      options:
        title: 'Grunt'

      server:
        options:
          message: 'Grunt has been activated.'

      grunt:
        options:
          message: 'Grunt has been updated.'

      jade:
        options:
          message: 'Jade files has been compiled.'

      sass:
        options:
          message: 'Sass files has been compiled.'

      js:
        options:
          message: 'JavaScript files have been concatenated and minified.'

      coffee:
        options:
          message: 'CoffeeScript files have been compiled.'

    # Watch Task
    watch:
      options:
        livereload: true
        dateFormat: (time) ->
          grunt.log.writeln('Grunt has finished in ' + time + 'ms!')
          grunt.log.writeln('Waiting...')
        event: ['all']
        interrupt: true

      configFiles:
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint', 'notify:grunt']
        options:
          reload: true

      jade:
        files: ['**/*.jade']
        tasks: ['jade:dev', 'notify:jade']

      sass:
        files: '**/*.{scss,sass}'
        tasks: ['sass:dev', 'postcss:dev', 'notify:sass']

      coffee:
        files: ['**/*.coffee']
        tasks: ['coffee:dev', 'coffeelint', 'notify:coffee']

  # Build Task
  grunt.registerTask 'jade-build', ['jade:dev', 'wiredep:dev']
  grunt.registerTask 'sass-build', ['sass:dev', 'postcss:dev']
  grunt.registerTask 'coffee-build', ['coffee:dev']

  # Default Task
  grunt.registerTask 'default', [
    'jade-build',
    'sass-build',
    'coffee-build',
    'connect',
    'watch'
  ]