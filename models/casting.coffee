mongoose = require('mongoose').Mongoose

mongoose.model('Casting', {
	properties: ['name'],
	
	indexes: [[{name: 1}, {unique: true}]],
	
	methods: 
		findByParams: (params) ->
			Casting.find(params)
})

exports.Casting = global.db.model('Casting')
