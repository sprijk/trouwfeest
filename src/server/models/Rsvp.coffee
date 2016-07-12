keystone = require "keystone"

Types = keystone.Field.Types

Rsvp = new keystone.List "Rsvp",
	defaultSort: "-gemaaktOp"

Rsvp.add
	email:
		required:    true
		initial:     true
		type:        Types.Email

	naam:
		required:    true
		initial:     true
		type:        Types.Text

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
			{ value: 0, label: "Ik / wij kom(en) helaas niet..."  }
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
		type:    Types.Datetime
		default: Date.now
		noedit:  true

Rsvp.defaultColumns = "email, naam, aantal, overnachten, berichtje, gemaaktOp"
Rsvp.register()
