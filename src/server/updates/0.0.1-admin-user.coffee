async    = require "async"
keystone = require "keystone"

module.exports = (done) ->
	User = keystone.list "User"

	(new User.model
		name:     first: 'Admin', last: 'User'
		email:    "s.p.rijk@gmail.com"
		password: "admin"
		isAdmin:  true
	).save done
