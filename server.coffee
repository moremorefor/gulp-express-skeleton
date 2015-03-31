express      = require 'express'
path         = require 'path'
favicon      = require 'serve-favicon'
logger       = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser   = require 'body-parser'
flash        = require 'connect-flash'
session      = require 'express-session'
mongoose     = require 'mongoose'

config       = require './app/config/config'

# DB
mongoose.connect(config.db)
require './app/models/user'

# App
app = express()
app.set 'views', path.join(__dirname, 'app/views')
app.set 'view engine', 'jade'
app.use logger('dev')
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: false)
app.use cookieParser('secretString')
app.use session(
  secret: 'secretString'
  resave: false
  saveUninitialized: true
  cookie:
    maxAge: 60000
)
app.use flash()
app.use express.static(path.join(__dirname, 'app/public'))
#app.use(favicon(__dirname + '/public/favicon.ico'));

index = require './app/routes/index'
users = require './app/routes/users'
app.use '/', index
app.use '/users', users


# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error('Not Found')
  err.status = 404
  next err
  return
# error handlers
# development error handler
# will print stacktrace
if app.get('env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err
    return
# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}
  return

module.exports = app
