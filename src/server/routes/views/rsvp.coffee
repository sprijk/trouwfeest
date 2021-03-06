_        = require "underscore"
keystone = require "keystone"
Rsvp     = keystone.list "Rsvp"
# Pagina   = keystone.list "Pagina"

log = require "../../lib/log"

exports = module.exports = (req, res, next) ->
	view = new keystone.View req, res

	{ locals } = res

	locals.section        = "rsvp"
	locals.aantalTypes    = Rsvp.fields.aantal.ops
	# locals.komtTypes      = Rsvp.fields.komt.ops
	locals.overnachtTypes = Rsvp.fields.overnachten.ops
	locals.formData       = req.body or {}
	locals.errors         = {}
	locals.submitted      = false

	view.on "init", (next) ->
		next()
		# Pagina.model
		# 	.findOne sectie: "rsvp"
		# 	.exec (error, pagina) ->
		# 		locals.pagina = pagina
		# 		next error

	view.on "post", action: "rsvp", (next) ->
		req.body.naam = _.chain [1..6]
			.map (i) -> req.body["naam_#{i}"]
			.compact()
			.join ", "
			.value()

		rsvp    = new Rsvp.model()
		updater = (new Rsvp.model()).getUpdateHandler req

		updater.process req.body, flashErrors: true, (error) ->
			if error
				locals.errors = error.errors
			else
				locals.rsvp = req.body

			next()

	view.render "rsvp", section: "rsvp"
