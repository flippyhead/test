util = require('util')
mongoose = require('mongoose').Mongoose
db = mongoose.connect('mongodb://localhost:27017/test')
User = db.model('User')

AccessDeniedError = require('errors').AccessDeniedError
AuthorizationFailedError = require('errors').AuthorizationFailedError

authorize = (req, user) ->
	req.session.user = user

this.deauthorize = (req, res, next) ->
	req.session.user = null
	next()
	
this.requireAuthorized = (req, res, next) ->
	return next(new AccessDeniedError('You are not authorized to view this page.')) unless req.session.user?
	next()
		
this.create = (req, res, next) ->
	return next() if req.session.user?

	req.authenticate ['facebook'], (error, authenticated) ->
		return next(new AuthorizationFailedError('Facebook failed to authorize you.')) unless authenticated?
		return next(new AuthorizationFailedError('Facebook returned an error: ' + error)) if error?
		
		facebookData = req.getAuthDetails().user
		
		console.log 'FINDING '
		
		User.find(email: facebookData.email).first (existingUser) ->
			if existingUser?
				authorize(req, existingUser)
			else
				userAttributes = email: facebookData.email, name: req.body.user
				console.log 'CREATING ' + JSON.stringify(userAttributes)
				newUser = new User(userAttributes)
				authorize(req, newUser)
			next()
	