function handle(r)

        r.content_type = "text/html"
        r:write("Hello world! You've reached the top level folder of this domain")
    
    local database, err = r:dbacquire("mysql", "host=localhost,user=monitor,pass=dbtest,dbname=test")
    if not err then 
    	r:write("conn ok")
    else
    	r:write(tostring(err))
    end
    return apache2.OK
end