function handle(r)
	r.content_type = "text/plain"
	if r.method == "POST" then
		local tab =r:parsebody()
		local db,err = r:dbacquire('mod_dbd')
		if not err then 
			local res, err = db:select(r,"SELECT name FROM games WHERE name='"..tab.gamename.."'")
			if not err then 
				local res0 = res(-1)

				if res0 == nil then 
					affected, err = db:query(r, "INSERT INTO games VALUES ('" .. tab.gamename .."','"..r:md5(tab.pwd).."','"..tab.scrname.."');")
					if not err then
						r:puts("completed; " .. affected)
					else 
						r:puts("?" ..err)
					end
				else 
					r:puts(tostring(res0))
					r:puts('game name already in use')
				end
			end
		end
    end
end