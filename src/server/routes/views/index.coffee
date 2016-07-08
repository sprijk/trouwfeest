keystone = require "keystone"

log = require "../../lib/log"

module.exports = (req, res, next) ->
	view   = new keystone.View req, res
	locals = res.locals
	user   = locals.user

	console.log user

	view.on "init", (next) ->
		next()
		# unless user
		# 	req.flash "error", locals.t "messages.error.contactSupport"
		# 	log.error "No user found in request object"
		# 	return res.redirect "/signin"

		# next()

	view.on "post", (next) ->
		next()
		# selectedEnvironment = req.body.environment or user.company.environments[0]?.url

		# unless selectedEnvironment
		# 	req.flash "error", locals.t "messages.error.noEnvironmentSelected"
		# 	return next()

		# res.redirect "#{selectedEnvironment}?token=#{getToken req}"

	view.render "index"
