local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local reverse_table = require(script.Parent.Parent.reverse_table)


it('reverse_table', function()
    local t = reverse_table({['abc'] = 'def'})
    expect(t['def']).toBe('abc')
end)
