keystone = require "keystone"
Rsvp     = keystone.list "Rsvp"

log = require "../../lib/log"

exports = module.exports = (req, res, next) ->
	view = new keystone.View req, res

	{ locals } = res

	locals.section        = "rsvp"
	locals.aantalTypes    = Rsvp.fields.aantal.ops
	locals.komtTypes      = Rsvp.fields.komt.ops
	locals.overnachtTypes = Rsvp.fields.overnachten.ops
	locals.formData       = req.body or {}
	locals.errors         = {}
	locals.submitted      = false

	view.on "post", action: "rsvp", (next) ->
		updater = (new Rsvp.model()).getUpdateHandler req

		updater.process req.body, flashErrors: true, (error) ->
			if error
				locals.errors = error.errors
			else
				locals.submitted = true

			next()

	view.render "rsvp", section: "rsvp"
