div id: 'liveControls', ->
	input type: 'text', id: 'liveSiteURL'
	
iframe src: 'http://yahoo.com', id: 'liveFrame', name: 'liveFrame', frameborder: 0, noresize: "noresize",
	# onload: 'BC.Application.go(window)'
	style: "position:absolute;background:transparent;width:100%;height:100%;top:32px;padding:0;z-index:1;"
	
coffeescript ->
	BC.Application.init();