keystone = require "keystone"
Rsvp     = keystone.list "Rsvp"

exports = module.exports = (req, { locals }) ->
	view = new keystone.View req, res

	locals.section          = "rsvp"
	locals.overnachtenTypes = Rsvp.fields.overnachten.ops;
	locals.formData         = req.body or {}
	locals.error            = {}
	locals.submitted        = false

	view.on "post", action: "rsvp", (next) ->
		updater = (new Rsvp.model()).getUpdateHandler req

		updater.process req.body, flashErrors: true, (error) ->
			if error
				locals.errors = error.errors
			else
				locals.submitted = true

			next()

	view.render "rsvp", section: "rsvp"
