module.exports = (grunt) ->
  grunt.initConfig
    clean:
      dist: ['docs']
    styleguide:
      styledocco:
        options:
          framework:
            name: 'styledocco'
          name: 'Sample'
        files:
          docs: ['css/style.css']
    watch:
      css:
        files: ['css/*.css']
        tasks: ['clean', 'styleguide']
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

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-styleguide'

  grunt.registerTask 'default', ['clean', 'styleguide', 'connect', 'watch']
