local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local String = require(script.Parent.Parent.PacketTypes.String)


it('write', function()
	local buff = buffer.create(8)

	expect(function()
		String.write(buff, 0, 'test')
	end).never.toThrow()

	expect(buffer.readu32(buff, 0)).toBe(4)
	expect(buffer.readstring(buff, 4, 4)).toBe('test')
end)

it('read', function()
	local buff = buffer.create(8)

	local read_buff = function()
		local _, value = String.read(buff, 0)
		return value
	end

	String.write(buff, 0, 'test')

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe('test')
end)
