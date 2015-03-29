gulp        = require 'gulp'
browserSync = require 'browser-sync'
config      = require '../config'
paths        = config.path

gulp.task 'browser-sync', ['nodemon'], ->
  browserSync
    proxy: "localhost:3000"
    port: 5000

gulp.task 'browser-reload', ->
  browserSync.reload()
