module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: "assets/scripts"
        src: "*.coffee"
        dest: "assets/dest/scripts"
        ext: ".js"

    sass:
      dist:
        files:
          "assets/dest/stylesheets/application.css" : "assets/stylesheets/application.sass"
    watch:
      coffee:
        files: "assets/scripts/*.coffee"
        tasks: "coffee"

      css:
        files: "assets/stylesheets/**/*.sass"
        tasks: "sass"

      livereload:
        options:
          livereload: true
        files: "assets/dest/**/*"

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "default", ["coffee", "sass"]
