local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Number16 = require(script.Parent.Parent.PacketTypes.Number16)


it('write', function()
	local buff = buffer.create(2)

	expect(function()
		Number16.write(buff, 0, -256)
	end).never.toThrow()

	expect(buffer.readi16(buff, 0)).toBe(-256)
end)

it('read', function()
	local buff = buffer.create(2)

	local read_buff = function()
		local _, value = Number16.read(buff, 0)
		return value
	end

	Number16.write(buff, 0, -256)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(-256)
end)
