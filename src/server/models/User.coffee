_        = require "underscore"
keystone = require "keystone"
async    = require "async"

Types = keystone.Field.Types

User  = new keystone.List "User"

User.add
	name:
		type:     Types.Name
		initial:  true
		required: true
		index:    true

	email:
		type:     Types.Email
		initial:  true
		required: true
		index:    true
		unique:   true

	password:
		type:     Types.Password
		initial:  true
		required: true

	, "Permissions",
		isAdmin:
			type:  Types.Boolean
			label: "Can access Admin"
			index: true

User.schema
	.virtual "canAccessKeystone"
	.get ->
		console.log "can access keystone?", @isAdmin
		@isAdmin

User.defaultColumns = "name, email, isAdmin"
User.register()
