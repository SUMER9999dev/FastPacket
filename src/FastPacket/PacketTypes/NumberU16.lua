--!native

return {
	write = function(source: buffer, offset: number, data: number): number
		buffer.writeu16(source, offset, data)
		return offset + 2
	end,

	read = function(source: buffer, offset: number): (number, number)
		local value = buffer.readu16(source, offset)
		return offset + 2, value
	end
}
