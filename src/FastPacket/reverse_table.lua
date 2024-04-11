--!native

local function reverse_table<K, V>(t: {[K]: V}): {[V]: K}
	local new = {}

	for key, value in t do
		new[value] = key
	end

	return new
end


return reverse_table
