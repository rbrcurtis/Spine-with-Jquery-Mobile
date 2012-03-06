Spine = require('spine')

class Record extends Spine.Model
	
	@configure "Record", 'name', 'brewery', 'variety', 'year', 'upc', 'label'
	
	@extend Spine.Model.Local
	@extend Spine.Model.Ajax
	
	
module.exports = Record