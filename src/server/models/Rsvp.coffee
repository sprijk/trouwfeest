keystone = require "keystone"

Types = keystone.Field.Types

Rsvp = new keystone.List "Rsvp",
	map:         name: "naam"
	defaultSort: "-gemaaktOp"

Rsvp.add
	email:
		required:    true
		initial:     true
		type:        Types.Email
		index:       true
		unique:      true

	naam:
		required:    true
		initial:     true
		type:        Types.Name

	komt:
		required:    true
		initial:     true
		type:        Types.Select
		emptyOption: false
		options: [
			{ value: "wel",  label: "Ik kom! ;)"   }
			{ value: "niet", label: "Ik ben er helaas niet bij..." }
		]

	aantal:
		initial:     true
		type:        Types.Select
		emptyOption: false
		numeric:     true
		options: [
			{ value: 1, label: "één"  }
			{ value: 2, label: "twee" }
			{ value: 3, label: "drie" }
			{ value: 4, label: "vier" }
			{ value: 5, label: "vijf" }
			{ value: 6, label: "zes"  }
		]

	overnachten:
		initial:     true
		type:        Types.Select
		emptyOption: false
		options: [
			{ value: "camping",     label: "Ik wil een plek op de camping" }
			{ value: "trekkershut", label: "Doe mij een trekkershut als dat lukt" }
			{ value: "hotel",       label: "Ik zit in een hotel" }
			{ value: "geen",        label: "Ik ga 's avonds laat weer naar huis" }
		]

	berichtje:
		type: Types.Textarea

	gemaaktOp:
		type:    Date
		default: Date.now

Rsvp.defaultColumns = "name, email, komt, aantal, overnachten, gemaaktOp"
Rsvp.register()
