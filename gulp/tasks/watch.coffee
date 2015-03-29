gulp   = require 'gulp'
browserSync = require 'browser-sync'
config = require '../config'
paths  = config.path

gulp.task 'watch', ->
  gulp.watch ["#{paths.watch.sass}", "#{paths.watch.scss}"], ['sass']
  gulp.watch ["#{paths.watch.coffee}"], ['browserify']
  gulp.watch ["#{paths.watch.jade}"], ['browser-reload']
  gulp.watch [
    "#{paths.watch.png}",
    "#{paths.watch.jpg}",
    "#{paths.watch.gif}"
  ], ['copy']
