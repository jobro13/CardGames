

function handle(r)
	if r.method == "POST" then 
		local tab = r:parsebody()
		local db,err = r:dbacquire('mod_dbd')
		if not err then 
			local res, err = db:select(r,"SELECT name FROM games WHERE name='"..tab.gamename.."' AND pwd='"..r:md5(tab.pwd).."'")
			local this = res(0)

			if this[1] ~= nil then 
				local sname = tab.scrname
				local gname = tab.gamename
				local gdbname = "game__"..tostring(gname)
				local res, err = db:query(r,"SHOW TABLES LIKE '"..gdbname.."'")
				if res < 1
					-- make db
					db:query("CREATE TABLE '"..gdbname.."")
			else 
				r:write("unknown gamename or wrong pwd")
			end
		end
	end
end 