require('json2ify')
require('es5-shimify')

require('spine')
require('spine/lib/local')
require('spine/lib/ajax')
require('spine/lib/manager')
require('spine/lib/route')
require('spine/lib/tmpl')

require('lib/stage')
require('lib/panel')

$('body').append("<div id=\"shutter\">")

Spine.Model.host = "http://localhost:3030"

Spine.Controller.include
	getRoute: ->
		route = window.location.hash
		if route.length>0 and route[0] is '#'
			route = route.substr 1
		if route[route.length-1] is '/'
			route = route.substring 0, route.length-1
		return route

window.toastShort = (msg) ->
	if plugins.toasty?
		console.log "toasty:#{msg}"
		plugins.toasty.showShort(msg)
	else
		console.log "mobile toast:#{msg}"
		$.mobile?.showToast(msg,1000)
		
window.toastLong = (msg) ->
	
	if plugins.toasty?
		plugins.toasty.showLong(msg)
	else
		$.mobile?.showToast(msg,2000)

window.transition = (cb, timeout = 250) ->
		shutter = $('#shutter')
		shutter.slideDown "fast", =>
			cb()
			setTimeout (=>shutter.slideUp("fast")), timeout
	
