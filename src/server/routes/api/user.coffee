_          = require "underscore"
{ Router } = require "express"
router     = Router()

keystone   = require "keystone"
User       = keystone.list "User"
Account    = keystone.list "Account"

log = require "../../lib/log"

router.get "/", (req, res) ->
	res.json _.pick req.user, [
		"sidebarActive"
	]

router.post "/", (req, res) ->
	fields = _.chain req.body
		.keys()
		.filter (key) -> key isnt "_id"
		.value()

	req.user.getUpdateHandler req
		.process req.body,
			fields: fields
			flashErrors: true
		, (error) ->
			if error
				req.flash "error", res.locals.t "messages.error.tryLater"
				log.error "An error occured while trying to update details for uid: `#{req.user._id}` error: #{error.message}"
				return res.status(500).json error: res.locals.t "messages.error.tryLater"

			res.status(200).json {}

module.exports = router