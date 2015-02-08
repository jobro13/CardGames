function handle(r)

        r.content_type = "text/html"
	--r.cache_control = "no-cache"
        r:write("Hello world! You've reached the top level folder of this domain")
    
    local database, err = r:dbacquire("mod_dbd")
    if not err then 
    	tab = database:select(r, "SELECT * FROM users");
	r:write(tostring(tab));
	tab = tab(0);
	r:write(tostring(tab));
	for i,v in pairs(tab) do
		r:write(v[1] .. v[2]);
	end
    else
    	r:write(tostring(err))
    end
    return apache2.OK
end
