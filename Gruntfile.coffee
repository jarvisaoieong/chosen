
module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    uglify:
      dist:
        src: 'dist/<%= pkg.name %>.js'
        dest: 'dist/<%= pkg.name %>.min.js'

    cssmin:
      dist:
        src: 'dist/<%= pkg.name %>.css'
        dest: 'dist/<%= pkg.name %>.min.css'

    copy:
      main:
        files: [
          expand: true
          cwd: 'lib'
          src: '*'
          dest: 'dist'
        ]

    watch:
      main:
        files: ['lib/*.js', 'lib/*.css']
        tasks: ['copy']

    clean: [
      'dist'
    ]

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'build', [
    'clean'
    'copy'
    'uglify'
    'cssmin'
  ]

  grunt.registerTask 'default', [
    'watch'
  ]
