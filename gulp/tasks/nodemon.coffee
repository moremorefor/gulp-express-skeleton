gulp    = require 'gulp'
nodemon = require 'gulp-nodemon'

gulp.task 'nodemon', (cb) ->
  called = false
  nodemon(
    script: 'bin/www'
    ext: 'coffee'
  )
  .on('start', ->
    unless called
      called = true
      cb()
  )
