_ = require "underscore"
$ = require "jquery"

removeGroups = ($namen, delta) ->
	$elems  = $namen.find ".form-group"
	elems   = $elems.get()
	removes = elems.slice elems.length - -delta, elems.length

	$ removes
		.each (elem) ->
			$(this).remove()

addGroups = ($namen, delta, current) ->
	for i in [1..delta]
		$group = $ "<div>"
			.attr
				class: "form-group"

		$col = $ "<div>"
			.attr
				class: "col-sm-8 col-sm-offset-4"

		$nameInput = $ "<input />"
			.attr
				type:        "text"
				name:        "naam_#{i}"
				value:       ""
				placeholder: "Voor- en achternaam"
				class:       "form-control"
				required:    "required"

		$col.append $nameInput
		$group.append $col
		$namen.append $group

$ ->
	$namen  = $ "#namen"
	$aantal = $ "#aantal"

	$aantal.on "change", (e) ->
		e.preventDefault()

		$input = $ e.target
		amount = parseInt $input.val()
		amount = 1 if amount is 0

		current = $namen
			.find ".form-group"
			.length

		delta = amount - current

		if      delta < 0 then removeGroups $namen, delta
		else if delta > 0 then addGroups    $namen, delta, current
