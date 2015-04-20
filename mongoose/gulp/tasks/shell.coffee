gulp  = require 'gulp'
shell = require 'gulp-shell'

gulp.task 'install', shell.task(
    [
      'bundle exec bourbon install',
      'bundle exec neat install',
      'bundle exec bitters install'
    ],
    { cwd: './app/public_src/css/plugin/'}
  )
