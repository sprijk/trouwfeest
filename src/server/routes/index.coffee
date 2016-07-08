bodyParser        = require "body-parser"
express           = require "express"
keystone          = require "keystone"

{
	initLocals,
	flashMessages,
	requireUser,
	requireAdmin,
} = require "./middleware"

importRoutes = keystone.importer __dirname

keystone.pre "routes", initLocals
keystone.pre "render", flashMessages

routes =
	views: importRoutes "./views"

exports = module.exports = (app) ->

	app.use bodyParser.json()

	app.all "/",      routes.views.index
	app.all "/rsvp" , routes.views.rsvp
