Spine = require 'spine'
Panel = require 'lib/panel'

class Menu extends Panel
	className: 'menu'
		
	events:
		'tap #scan':			'scan'
		'tap #input':			'input'
		'tap #database':	'database'
		
	constructor: ->
		super
		@render()
		@log 'menu created'

	active: ->
		super
		@log "menu active"

	render: ->
		@html require('views/menu')()
		
	scan: (e) ->
		@navigate '/scanner'
		
	input: (e) ->
		@navigate '/input'
		
	database: (e) ->
		@navigate '/db'

		
module.exports = Menu