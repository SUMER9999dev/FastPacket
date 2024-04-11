local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Packet = require(script.Parent.Parent.Packet)
local Number8 = require(script.Parent.Parent.PacketTypes.Number8)


local function create_test_packet()
    return Packet.new {
        value = Number8
    }
end


it('Packet write', function()
    local packet = create_test_packet()
    local buff = buffer.create(1)

    expect(function()
        packet:write(buff, {value = 25}, 0)
    end).never.toThrow()

    expect(buffer.readi8(buff, 0)).toBe(25)
end)

it('Packet write failed', function()
    local packet = create_test_packet()
    local buff = buffer.create(1)

    expect(function()
        packet:write(buff, {}, 0)
    end).toThrow('Data doesn\'t have value field specified.')
end)

it('Packet read', function()
    local packet = create_test_packet()
    local buff = buffer.create(1)

    packet:write(buff, {value = 25}, 0)
    local _, data = packet:read(buff, 0)

    expect(data).toEqual({value = 25})
end)

it('Packet read failed', function()
    local packet = create_test_packet()
    local buff = buffer.create(0)

    expect(function()
        packet:read(buff, 0)
    end).toThrow('Packet failed to read value field.')
end)
