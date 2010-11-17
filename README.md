# BrowserCasting.com

## Controllers

Login/Signup
* join/login by Facebook Connect
* land on page with instructions on install bookmarklet or how to start 'casting
* 

## Models

Goals:

For a user:
* quickly list up to 200 most recently visited sites
* quickly summarize trending sites for arbitrary periods
* quickly search for specific sites by url-part
* update site listing in real-time

Across all users:
* quickly list up to 200 most recently visited sites
* quickly summarize trending sites for arbitrary periods
* update site listings in real-time

### Sites
{
	id: 123123123,
	url: http://googles.com,
	created_at: 2342342323
	visits:[
		{
			user_id: 123123123,
			started_at: 123123123, 
			ended_at: 234234234			
		}
	]
}

### Users

{
	id: 1,
	name: 'name',
	email: 'name@email.com',
	location: 'San Francisco, CA',
	sites: [
		{
			url: 'http://yahoo.com',
			created_at: 12312312,
			visits: [
				{
					started_at: 123123123, 
					ended_at: 234234234
				}
			]			
		}
	]
}


{
	id: 1,
	url: 'http://yahoo.com',
	created_at: 1231231
}


### Users

{
	id: 1,
	name: 
}


### URLs
@id
@url
@created_at

### Visits
@id
@site_id
@user_id
@started_at
@ended_at

### Users
@id
@visits
@sites 
@created_at
@updated_at
@name


## Controllers

### Server

### Redis

### Util

### Client