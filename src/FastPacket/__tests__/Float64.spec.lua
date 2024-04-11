local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Float64 = require(script.Parent.Parent.PacketTypes.Float64)


it('write', function()
	local buff = buffer.create(16)

	expect(function()
		Float64.write(buff, 0, 5.1)
	end).never.toThrow()

	expect(buffer.readf64(buff, 0)).toBeCloseTo(5.1)
end)

it('read', function()
	local buff = buffer.create(16)

	local read_buff = function()
		local _, value = Float64.read(buff, 0)
		return value
	end

	Float64.write(buff, 0, 5.1)

	expect(read_buff).never.toThrow()
	expect(read_buff()).toBeCloseTo(5.1)
end)
