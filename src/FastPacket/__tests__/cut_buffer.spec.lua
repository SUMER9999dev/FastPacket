local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local cut_buffer = require(script.Parent.Parent.cut_buffer)


it('cut_buffer', function()
	local buff = buffer.create(255)

    buffer.writeu8(buff, 0, 10)

    local cutted_buff = cut_buffer(buff, 1)

    expect(buffer.len(cutted_buff)).toBe(1)
    expect(buffer.readu8(cutted_buff, 0)).toBe(10)
end)
