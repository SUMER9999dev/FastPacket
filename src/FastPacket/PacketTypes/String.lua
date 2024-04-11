--!native

return {
	write = function(source: buffer, offset: number, data: string): number
		local length = #data

		buffer.writeu32(source, offset, length)
		buffer.writestring(source, offset + 4, data)

		return offset + 4 + length
	end,

	read = function(source: buffer, offset: number): (number, string)
		local length = buffer.readu32(source, offset)
		local value = buffer.readstring(source, offset + 4, length)

		return offset + 4 + length, value
	end
}
