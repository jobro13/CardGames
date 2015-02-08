local header = require"require/header"
local dbox = require"require/dbox"
local head = require"require/head"

function handle(r)
	r:write("<html>")
	r:write(head)
	r:write('<body class="bodysize">\n')
	r:write(header)
	opt = {{
		text = "Spelnaam",
		name = "gamename",
		type = "text",
	},
	{
		text = "Spelwachtwoord",
		name = "pwd",
		type="password",
	},
	{
		text = "Schermnaam",
		name = "scrname",
		type="text",

	}}
	r:write(dbox("Speel LIEGEN ONLINE!", opt, "/ServerRoot/processlogin.lua", "post"))
	r:write("</body></html>")
end 