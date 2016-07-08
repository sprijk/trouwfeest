winston = require "winston"
config  = require "../../../cfg"

level = "info"
level = "debug" if process.env.DEBUG in ["1", "true"]

timestamp = false
timestamp = true if process.env.NODE_ENV is "production"

transports = [
	new winston.transports.Console
		timestamp: timestamp
		colorize:  true
		level:     level
]

module.exports = new winston.Logger transports: transports