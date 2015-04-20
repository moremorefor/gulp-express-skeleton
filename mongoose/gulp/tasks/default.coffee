gulp        = require 'gulp'
browserSync = require 'browser-sync'
runSequence = require 'run-sequence'

gulp.task 'default', ['del'], ->
  runSequence(
    ['sass', 'browserify', 'imagemin'],
    'browser-sync',
    'watch'
  )
