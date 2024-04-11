local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local NumberU16 = require(script.Parent.Parent.PacketTypes.NumberU16)


it('write', function()
	local buff = buffer.create(2)

	expect(function()
		NumberU16.write(buff, 0, 5)
	end).never.toThrow()

	expect(buffer.readu16(buff, 0)).toBe(5)
end)

it('read', function()
	local buff = buffer.create(2)

	local read_buff = function()
		local _, value = NumberU16.read(buff, 0)
		return value
	end

	NumberU16.write(buff, 0, 5)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(5)
end)
