# Paths
require.paths.unshift('./models')
require.paths.unshift('./controllers')
require.paths.unshift('./lib')

# Modules
sys = require("sys")
http = require("http")
url = require("url") 
path = require("path")
io = require('socket.io')
fs = require("fs")
util = require('util')
auth = require('connect-auth')
express = require('express')
oauth = require('oauth')
mongoStore = require('connect-mongodb')
mongoose = require('/usr/local/lib/node/.npm/mongoose/0.0.3/package/lib/mongoose')

# Errors
DocumentNotFoundError = require('errors').DocumentNotFoundError
AccessDeniedError = require('errors').AccessDeniedError

# Global
global.db = mongoose.connect('mongodb://localhost:27017/test')

# Controllers
Castings = require('castings')
Users = require('users')

# App Config
global.db.addListener 'error', (errObj,scope_of_error) ->
	console.log util.inspect(errObj)

app = require('express').createServer()

app.configure ->
	app.use express.logger()
	app.use express.bodyDecoder()
	app.use express.methodOverride()
	app.use express.cookieDecoder()
	app.use express.session store: mongoStore()
	app.use auth [
		auth.Anonymous,
		auth.Facebook appId: 110187725713521, appSecret: '07b7e3568ba6efd42ca2e1378a1c6fbe', scope: 'email', callback: 'http://localhost.com:3000/auth/facebook_callback',
	]
	app.use express.staticProvider(__dirname + '/public')
	app.use express.compiler({src: __dirname + '/public', enable:['less'] })

	app.register '.coffee', require('coffeekup')
	app.set 'view engine', 'coffee'
	app.set 'view options', {layout: true}

app.configure 'development', ->
	app.use express.errorHandler(dumpExceptions: true, showStack: true)

# App Routes
app.get '/', (req, res) ->
	res.render 'index'

app.post '/auth/facebook', Users.create, (req, res) ->
	res.render 'index'

app.delete '/auth', Users.deauthorize, (req, res) ->
	res.render 'index'

app.get '/live', Users.requireAuthorized, (req, res) ->
	res.render 'live'

app.get '/record.:format?', Users.requireAuthorized, (req, res) ->
	res.render 'live'
	
app.get '/:name', Castings.find, (req, res) ->
	res.render 'castings/show', context: {casting: req.casting}

app.error (error, req, res, next) ->
	# if error instanceof DocumentNotFoundError
	res.render 'error', context: {error: error}		
	# else
	# 	next error

app.listen(3000)
