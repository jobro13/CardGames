local header = require"require/header"
local dbox = require"require/dbox"
local head = require"require/head"

function handle(r)
	r:write("<html>")
	r:write(head)
	r:write('<body class="bodysize">\n')
	r:write(header)
	local db,err = r:dbacquire('mod_dbd')
		if not err then 
			res, err = db:select(r,"SELECT * FROM games;")
			if not err then 
				r:write('<table border="1" class="gamelisttable">')
				

				local all = res(0,true);
				r:write('<tr class="tabtitle"><td>Game name</td><td>Players playing/Total players required</td><td>Is playing</td><td>Creation time</td></tr>')
				for id, data in pairs(all) do 
					r:write("<tr>")
			
					if (data.isplaying == "0") and (os.time() - data.time) > (60 * 10) then 
						db:query(r,"DELETE FROM games WHERE name='"..data.name.."';")

					else 
						for _,index in pairs({"name", "nump", "isplaying", "time"}) do
							local str = tostring(data[index])
							if index == "nump" then
								str = tostring(data.numpin) .. "/" .. str
							end 
							if index == "time" then
								local v = "Made " ..( os.time() - (tonumber(str) or 0)) .. " seconds ago"
								str=v
							end

							r:write("<td>" .. str .. "</td>\n")
					end 
					r:write("</tr>")
				end 
				r:write("</table>")
			end
		end
	end	
	r:write("</body></html>")
end 