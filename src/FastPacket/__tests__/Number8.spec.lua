local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Number8 = require(script.Parent.Parent.PacketTypes.Number8)


it('write', function()
	local buff = buffer.create(1)

	expect(function()
		Number8.write(buff, 0, -5)
	end).never.toThrow()

	expect(buffer.readi8(buff, 0)).toBe(-5)
end)

it('read', function()
	local buff = buffer.create(1)

	local read_buff = function()
		local _, value = Number8.read(buff, 0)
		return value
	end

	Number8.write(buff, 0, -5)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(-5)
end)
