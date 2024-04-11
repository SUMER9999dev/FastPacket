local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local NumberU32 = require(script.Parent.Parent.PacketTypes.NumberU32)


it('write', function()
	local buff = buffer.create(4)

	expect(function()
		NumberU32.write(buff, 0, 5)
	end).never.toThrow()

	expect(buffer.readu16(buff, 0)).toBe(5)
end)

it('read', function()
	local buff = buffer.create(4)

	local read_buff = function()
		local _, value = NumberU32.read(buff, 0)
		return value
	end

	NumberU32.write(buff, 0, 5)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(5)
end)
