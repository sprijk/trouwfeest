_ = require "underscore"

log = require "../lib/log"

exports.initLocals = (req, { locals }, next) ->
	locals.currentUrl = req.originalUrl
	locals.user       = req.user

	next()

exports.flashMessages = (req, res, next) ->
	flashMessages =
		info:    req.flash "info"
		success: req.flash "success"
		warning: req.flash "warning"
		error:   req.flash "error"

	res.locals.messages = if _.any flashMessages, (msgs) -> msgs.lengtht then flashMessages else false

	next()

exports.requireUser = (req, res, next) ->
	unless req.user
		return res.redirect "/keystone/signin"

	next()

exports.requireAdmin = (req, res, next) ->
	unless req.user and req.user.isAdmin
		req.flash "error", "You are not authorized to view this page."
		return res.redirect "/"

	next()