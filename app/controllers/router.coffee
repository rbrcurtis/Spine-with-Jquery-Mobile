Spine 	= require 'spine'
Menu 		= require 'controllers/menu'
Record	= require 'models/record'

class Router extends Spine.Controller
	
	constructor: ->
		super
	
		@log "router created"
		
		@initControllers()
		@setupRoutes()
		@fetchModels()
		
		
	active: ->
		transition =>
			@log "route is '#{@getRoute()}'"
			if @getRoute() is '' or @getRoute() is '/' then @navigate '/menu'
			else Spine.Route.matchRoute @getRoute()
		
	initControllers: ->
		@menu = 		new Menu
		
	fetchModels: ->
		Record.fetch()
		
	changePage: (controller, params) ->
		timeout = if controller is @menu then 500 else 250
		transition =>

			@log "navigating to #{controller['className']}"
			page = $("div.panel.#{controller['className']}")
			controller.active()
			page.trigger('create')
			$.mobile?.changePage(page)
		
		, timeout
		
	setupRoutes: ->
		@routes
			'/menu': (params) -> @changePage @menu, params
			
		
module.exports = Router