local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Number32 = require(script.Parent.Parent.PacketTypes.Number32)


it('write', function()
	local buff = buffer.create(4)

	expect(function()
		Number32.write(buff, 0, -256)
	end).never.toThrow()

	expect(buffer.readi32(buff, 0)).toBe(-256)
end)

it('read', function()
	local buff = buffer.create(4)

	local read_buff = function()
		local _, value = Number32.read(buff, 0)
		return value
	end

	Number32.write(buff, 0, -256)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBe(-256)
end)
