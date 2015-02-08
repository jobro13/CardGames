local out = {}

-- title: box title;
-- qlist: list of input fields ({text=text, type=type,name=name})
--blist: first id is the submit button.
-- target: target URL (action)
-- method: POST or user-known
function make(title, qlist,  target, method)
	local method = method or "post"
	-- start making header string 
	local buff = ""
	local function append(str)
		buff = buff .. str
	end 
	append('<section class="centered">\n')
	local this = '<form class="loginform" method="'..method..'" action="'..target..'">\n'
	append(this)
	append('<fieldset class="loginvalues">\n')
	for id, data in pairs(qlist) do
		local top = "<label>\n"
		top = top .. data.text
		top = top .. '<input type="' .. (data.type or "text") ..'" name="'..data.name..'">\n'
		top = top .. "</label>\n"
		append(top)
	end
	append("</fieldset>")
	append('<fieldset class="loginactions">\n')
	append('<input class="btn floatl" type="submit" name="submit" value="Submit">\n')
	append('</fieldset>\n')
	append("</form>\n")
	append("</section>\n")
	return buff 
end

return make 