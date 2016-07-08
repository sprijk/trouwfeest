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
	app.all "/rspv" , routes.views.rspv

	# api = express.Router()

	# api.use "/widgets",       require "./api/widgets"
	# api.use "/config",        require "./api/config"
	# api.use "/migrate",       require "./api/migrate"
	# api.use "/user",          require "./api/user"

	# app.use "/api/v1",        api
