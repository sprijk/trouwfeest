require("source-map-support").install() if process.env.NODE_ENV isnt "production"

_        = require "underscore"
async    = require "async"
keystone = require "keystone"

config  = require  "../../cfg"
log     = require "./lib/log"

keystone.init
	"name":          "Simon & Hannah gaan trouwen!"
	"favicon":       "client/favicon.ico"
	"static":        [ "../client" ]
	"views":         "templates/views"
	"view engine":   "jade"
	"auto update":   true
	"mongo":         config.mongo
	# "session":       true
	"session":       false
	"auth":          true
	"user model":    "User"
	"cookie secret": config.server.cookieSecret
	"port":          config.server.port

keystone.import "models"

keystone.set "locals",
	_:        _
	env:      keystone.get "env"
	utils:    keystone.utils
	editable: keystone.content.editable

keystone.set "routes",  require "./routes"

keystone.start
	onHttpServerCreated: ->
		log.info "trouwfeest listening on port `#{config.server.port}`."

