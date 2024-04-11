local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Float32 = require(script.Parent.Parent.PacketTypes.Float32)


it('write', function()
	local buff = buffer.create(8)

	expect(function()
		Float32.write(buff, 0, 5.1)
	end).never.toThrow()

	expect(buffer.readf32(buff, 0)).toBeCloseTo(5.1)
end)

it('read', function()
	local buff = buffer.create(8)
	local read_buff = function()
		local _, value = Float32.read(buff, 0)
		return value
	end

	Float32.write(buff, 0, 5.1)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBeCloseTo(5.1)
end)
