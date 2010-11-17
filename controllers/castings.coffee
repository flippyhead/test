util = require('util')
Casting = require('casting').Casting
DocumentNotFoundError = require('errors').DocumentNotFoundError
DocumentExistsError = require('errors').DocumentExistsError

this.reserve = (req, res, next) ->
	params = req.body.casting
	
	Casting.find(params).first (existing) ->
		if existing?
			next(new DocumentExistsError('Casting name already in use: ' + util.inspect(params)))
		else
			req.session.reservedCasting = params
			next()

this.find = (req, res, next) ->
	params = req.params
	Casting.find(params).first (casting)->
		if casting
			req.casting = casting
			next()
		else 
			next(new DocumentNotFoundError('Casting not found: ' + util.inspect(params)))	
	
this.create = (req, res, next) ->
	params = req.body.casting || req.session.reservedCasting
		
	Casting.find(params).first (t)->
		unless t
			casting = new Casting(params)
			casting.save()
			req.session.casting = casting
		next()