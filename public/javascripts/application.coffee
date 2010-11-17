window.BC = {}

BC.Application =
	init: ->
		this.target = $('#liveFrame')
		
		jQuery(document).ready ($)=>
			this.adjustWindowHeight()
			this.broadcast()
		
	adjustWindowHeight: ->
		targetHeight = $(window).height()-32
		this.target.css width: '100%', height: targetHeight+'px'

	go: (location)->
		alert(location.href)

	broadcast: ()->		
		frames["liveFrame"].onload = ()->
			alert('xxx')
			
		console.log(this.target);