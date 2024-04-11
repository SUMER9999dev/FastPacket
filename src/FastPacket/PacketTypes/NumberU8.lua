--!native

return {
	write = function(source: buffer, offset: number, data: number): number
		buffer.writeu8(source, offset, data)
		return offset + 1
	end,

	read = function(source: buffer, offset: number): (number, number)
		local value = buffer.readu8(source, offset)
		return offset + 1, value
	end
}
