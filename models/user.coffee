mongoose = require('mongoose').Mongoose

mongoose.model('User', {
	
	properties: [
		'name', 
		'email', 
		{
			'sites': [[
				'url', 
				'last_visited_at', 
				{'visits': []}
			]]
		}
	],
	
	indexes: [
		[{'name': 1}, {unique: true, dropDups : true}], 
		[{'email': 1}, {unique: true, dropDups : true}],
		[{'sites.url': 1, 'name': 1}, {unique: true, dropDups : true}]
	],
	
})

exports.User = (db) ->
	db.model('User')