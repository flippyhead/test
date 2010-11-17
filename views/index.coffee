h1 'Start Browser Casting Now'

section -> 
	form action: '/auth/facebook', method: 'POST', ->
		span 'http://browsercasting.org/' 
		input type: 'text', name: 'user[name]'
		input type: 'submit', value: 'Connect with Facebook'

# div class:"main", ->
# 	a href:"/auth/facebook", ->
# 		span "Connect with Facebook"

section ->		
	form action: '/auth', method: 'POST', ->
		input type: 'hidden', name: '_method', value: 'DELETE'
		input type: 'submit', value: 'Logout'


# label class:"fb_connect_button uiButtonNoText uiButton uiButtonConfirm uiButtonLarge", ->
# 	img class:"mrs customimg img", src:"http://static.ak.fbcdn.net/rsrc.php/z1/r/NCgOYDusJlg.jpg", width:"38", height:"37"
# 	input value:"", type:"submit"