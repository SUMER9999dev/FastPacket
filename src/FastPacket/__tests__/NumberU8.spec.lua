local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local NumberU8 = require(script.Parent.Parent.PacketTypes.NumberU8)


it('write', function()
	local buff = buffer.create(1)

	expect(function()
		NumberU8.write(buff, 0, 5)
	end).never.toThrow()

	expect(buffer.readu8(buff, 0)).toBe(5)
end)

it('read', function()
	local buff = buffer.create(1)

	local read_buff = function()
		local _, value = NumberU8.read(buff, 0)
		return value
	end

	NumberU8.write(buff, 0, 5)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(5)
end)
