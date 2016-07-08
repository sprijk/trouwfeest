keystone = require "keystone"

Types = keystone.Field.Types

Rsvp = new keystone.List "Rsvp",
	map:         name: "naam"
	defaultSort: "-gemaaktOp"

Rsvp.add
	email:
		required: true
		initial:  true
		type:     Types.Email
		index:    true
		unique:   true

	naam:
		required: true
		initial:  true
		type:     Types.Name

	komt:
		required: true
		initial:  true
		type:     Types.Boolean
		default:  true

	aantal:
		required: true
		initial:  true
		type:     Types.Number

	overnachten:
		required: true
		initial:  true
		type:     Types.Select
		options:  [
			{ value: "camping",     label: "Ik wil een plek op de camping" }
			{ value: "trekkershut", label: "Doe mij een trekkershut als dat lukt" }
			{ value: "hotel",       label: "Ik zit in een hotel" }
			{ value: "geen",        label: "Ik ga 's avonds laat weer naar huis" }
		]

	gemaaktOp:
		type:    Date
		default: Date.now

Rsvp.defaultColumns = "name, email, komt, aantal, overnachten, gemaaktOp"
Rsvp.register()
