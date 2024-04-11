local JestGlobals = require(game.ReplicatedStorage.Packages.JestGlobals)

local it = JestGlobals.it
local expect = JestGlobals.expect

local Packet = require(script.Parent.Parent.Packet)
local Stream = require(script.Parent.Parent.Stream)
local Number8 = require(script.Parent.Parent.PacketTypes.Number8)


local function create_test_packet()
    return Packet.new {
        value = Number8
    }
end


local function create_stream(packet)
    return Stream.new(4, {packet})
end


it('Stream append & flush', function()
    local packet = create_test_packet()
    local stream = create_stream(packet)

    stream:append(packet, {
        value = 25
    })

    local flushed = stream:flush()

    expect(buffer.len(flushed)).toBe(2)
    expect(buffer.readu8(flushed, 0)).toBe(1)
    expect(buffer.readi8(flushed, 1)).toBe(25)
end)

it('Stream read', function()
    local packet = create_test_packet()
    local stream = create_stream(packet)

    stream:append(packet, {
        value = 25
    })

    local flushed = stream:flush()

    expect(stream:read(flushed)).toEqual({
        [packet] = {
            { value = 25 }
        }
    })
end)

it('Stream append unknown packet', function()
    local packet = create_test_packet()
    local stream = create_stream(packet)

    expect(function()
        stream:append(create_test_packet(), {
            value = 25
        })
    end).toThrow('PacketStream doesn\'t support that packet type.')
end)

it('Stream read failed', function()
    local packet = create_test_packet()
    local stream = create_stream(packet)

    expect(function()
        local source = buffer.create(4)

        buffer.writeu8(source, 0, 2)

        stream:read(source)
    end).toThrow('Unknown packet index: 2')
end)
