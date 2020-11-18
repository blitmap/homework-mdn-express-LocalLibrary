createError   = require 'http-errors'
express       = require 'express'
path          = require 'path'
cookieParser  = require 'cookie-parser'
logger        = require 'morgan'

indexRouter   = require './routes/index'
usersRouter   = require './routes/users'

app = express()

# view engine setup
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'pug'

app.use logger 'dev'
app.use express.json()
app.use express.urlencoded extended: false
app.use cookieParser()
app.use express.static path.join __dirname, 'public'

app.use '/',      indexRouter
app.use '/users', usersRouter

# catch 404 and forward to error handler
app.use (_, __, next) -> next createError 404

# error handler
app.use (err, req, res, next) ->
	# set locals, only providing error in development
	res.locals.message = err.message
	res.locals.error   = {}
	res.locals.error   = err if req.app.get('env') is 'development'

	# rendor the error page
	res.status err.status ? 500
	res.render 'error'

module.exports = app
