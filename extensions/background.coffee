window.BC = {}

window.BC.Background =
	listen: ->
		chrome.cookies.getAll {}, (cookies)->
			console.log cookies
			
		chrome.extension.onRequest.addListener (request, sender, callback)->
			jQuery(document).ready ($)=>
				$.ajax
					url: "http://localhost.com:3000/record?url=" + request.url
					success: (data, status)-> 
						callback(data, status)