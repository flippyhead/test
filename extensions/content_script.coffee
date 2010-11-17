BC = {}

BC.ContentScript =	
	record: ->
		chrome.extension.sendRequest {action: 'record', url: window.location.href}, (data, status)->
			console.log(data)
			console.log(status)

BC.ContentScript.record()