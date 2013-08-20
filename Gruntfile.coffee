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
          docs: ['css/*.css']
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
          base: 'docs'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-styleguide'

  grunt.registerTask 'default', ['clean', 'styleguide', 'connect', 'watch']
