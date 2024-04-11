--!native

local function cut_buffer(source: buffer, size: number): buffer
	local cutted = buffer.create(size)

	buffer.copy(cutted, 0, source, 0, size)	

	return cutted
end


return cut_buffer
