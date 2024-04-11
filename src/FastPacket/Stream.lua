local LuauClass = require(script.Parent.LuauClass)

local types = require(script.Parent.types)

local cut_buffer = require(script.Parent.cut_buffer)
local reverse_table = require(script.Parent.reverse_table)


local PacketStream = LuauClass {_type = 'PacketStream'} :: types.PacketStream

function PacketStream:__init(size: number, packets: {types.Packet})
    self.__stream = buffer.create(size)
    self.__cursor = 0

    self.__reversed_packet_map = reverse_table(packets)
    self.__packet_map = packets
end

function PacketStream:append(packet: types.Packet, data: { [string]: any })
    if not self.__reversed_packet_map[packet] then
        error('PacketStream doesn\'t support that packet type.')
    end

    buffer.writeu8(self.__stream, self.__cursor, self.__reversed_packet_map[packet])

    self.__cursor += 1
    self.__cursor = packet:write(self.__stream, data, self.__cursor)
end

function PacketStream:read(source: buffer): {[types.Packet]: { {[string]: any} }}
    local result = {}

    for _, packet in self.__packet_map do
        result[packet] = {}
    end

    local length = buffer.len(source)
    local cursor = 0

    while cursor < length do
        local packet_index = buffer.readu8(source, cursor)
        local packet = self.__packet_map[packet_index]

        if not packet then
            error(`Unknown packet index: {packet_index}`)
        end

        local value = nil

        cursor += 1
        cursor, value = packet:read(source, cursor)

        table.insert(result[packet], value)
    end

    return result
end

function PacketStream:flush(): buffer
    local result = cut_buffer(self.__stream, self.__cursor)
    self.__cursor = 0
    return result
end

return PacketStream
