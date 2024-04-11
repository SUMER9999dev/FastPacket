--!native

return {
	write = function(source: buffer, offset: number, data: number): number
		buffer.writef64(source, offset, data)
		return offset + 8
	end,

	read = function(source: buffer, offset: number): (number, number)
		local value = buffer.readf64(source, offset)
		return offset + 8, value
	end
}
