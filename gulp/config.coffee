srcDir = 'public_src'
destDir = 'public'

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
    jade   : 'views/*.jade'
    sass   : srcDir + '/**/*.sass'
    scss   : srcDir + '/**/*.scss'
    coffee : srcDir + '/**/*.coffee'
    png    : srcDir + '/**/*.png'
    jpg    : srcDir + '/**/*.jpg'
    gif    : srcDir + '/**/*.gif'

module.exports =
  path: path