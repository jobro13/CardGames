function handle(r)
	if r:wsupgrade() then
		-- oh yippee
		r:wswrite("connected")

		local line, fin = r:wsread()
		while line do
			-- echo;
			r:wswrite(line)
			line, fin = r:wsread()
		end

		r:wsclose()
	end
end