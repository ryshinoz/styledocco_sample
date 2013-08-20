module.exports = (grunt) ->
  grunt.initConfig
    clean:
      styledocco: ['docs']
      build: ['build']
      dist: ['dist']
    concat:
      dist:
        dest: 'build/css/app.css'
        src: ['css/*.css']
    cssmin:
      compress:
        files:
          'dist/css/app.min.css': 'build/css/app.css'
    styleguide:
      styledocco:
        options:
          framework:
            name: 'styledocco'
          name: 'Sample'
        files:
          docs: ['css/*.css']
    watch:
      readme:
        files: ['README.md']
        tasks: ['clean', 'styleguide']
        options:
          livereload: false
      css:
        files: ['css/*.css']
        tasks: ['clean', 'concat', 'cssmin', 'styleguide']
        options:
          livereload: false
      html:
        files: ['docs/*.html']
        tasks: []
        options:
          livereload: true
    connect:
      server:
        options:
          port: 9000
          base: 'docs'

  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-styleguide'

  grunt.registerTask 'default', ['clean', 'concat', 'cssmin', 'styleguide', 'connect', 'watch']
