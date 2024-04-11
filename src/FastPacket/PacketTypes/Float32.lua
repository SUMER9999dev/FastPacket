--!native

return {
	write = function(source: buffer, offset: number, data: number): number
		buffer.writef32(source, offset, data)
		return offset + 4
	end,

	read = function(source: buffer, offset: number): (number, number)
		local value = buffer.readf32(source, offset)
		return offset + 4, value
	end
}
