srcDir = 'app/public_src'
destDir = 'app/public'
srcTestDir = 'test'
destTestDir = 'powered_test'

path =
  src:
    dir    : srcDir
    sass   : srcDir + '/stylesheets/app.sass'
    img    : srcDir + '/images/*'
    coffee : './' + srcDir + '/javascripts/main.coffee'
  dest:
    dir    : destDir
    sass   : destDir + '/stylesheets'
    img    : destDir + '/images'
    coffee : destDir + '/javascripts/'
  watch:
    jade   : 'app/views/**/*.jade'
    sass   : srcDir + '/**/*.sass'
    scss   : srcDir + '/**/*.scss'
    coffee : srcDir + '/**/*.coffee'
    png    : srcDir + '/**/*.png'
    jpg    : srcDir + '/**/*.jpg'
    gif    : srcDir + '/**/*.gif'
  test:
    src    : srcTestDir + '/**/*.coffee'
    dest   : destTestDir
    run    : destTestDir + '/**/*.js'

module.exports =
  path: path
