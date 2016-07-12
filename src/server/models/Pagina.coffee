# keystone = require "keystone"

# Types = keystone.Field.Types

# Pagina = new keystone.List "Pagina",
# 	singular: "Pagina"
# 	plural:   "Paginas"

# Pagina.add
# 	titel:
# 		type: Types.Text

# 	sectie:
# 		type: Types.Text

# 	inhoud:
# 		brief:
# 			type:    Types.Html
# 			wysiwyg: true
# 			height:  150


# 		extended:
# 			type:    Types.Html
# 			wysiwyg: true
# 			height:  400

# Pagina.defaultColumns = "titel, sectie"
# Pagina.register()
