local header = require"require/header"
local dbox = require"require/dbox"
local head = require"require/head"

function handle(r)
	r:write("<html>")
	r:write(head)
	r:write('<body class="bodysize">\n')
	r:write(header)
	opt = {{
		text = "Game name",
		name = "gamename",
		type = "text",
	},
	{
		text = "Game password (optional)",
		name = "pwd",
		type="password",
	},
	{
		text = "Your screen name",
		name = "scrname",
		type="text",

	}}
	r:write(dbox("Create game", opt, "/ServerRoot/creategame.lua", "post"))
	r:write("</body></html>")
end 