keystone = require "keystone"
# Pagina   = keystone.list "Pagina"

log = require "../../lib/log"

module.exports = (req, res, next) ->
	view   = new keystone.View req, res
	locals = res.locals

	view.on "init", (next) ->
		next()
		# Pagina.model
		# 	.findOne sectie: "home"
		# 	.exec (error, pagina) ->
		# 		locals.pagina = pagina
		# 		next error

	view.render "index"
