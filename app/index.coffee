require('lib/setup')

Spine = require 'spine'
Stage = require 'lib/stage'
Router = require 'controllers/router'

class App extends Stage.Global
	
	
	constructor: ->
		super
	
		# $('body').bind 'click', (e) ->	e.preventDefault()
		# @el.bind 'touchmove', (e) ->		e.preventDefault()

		Spine.Route.setup()

		@router = new Router()
		@router.active()
		
		

module.exports = App