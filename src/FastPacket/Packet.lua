local LuauClass = require(script.Parent.LuauClass)

local types = require(script.Parent.types)
local cut_buffer = require(script.Parent.cut_buffer)


local Packet = LuauClass {_type = 'Packet'} :: types.Packet

function Packet:__init(fields: {[string]: types.PacketType<any>})
    self.__info = fields
end

function Packet:write(to: buffer, data: {[string]: any}, offset: number): number
    local cursor = offset

    for field, packet_type in self.__info do
        local value = data[field]

        if not value then
            error(`Data doesn't have {field} field specified.`)
        end

        cursor = packet_type.write(to, cursor, value)
    end

    return cursor
end

function Packet:read(from: buffer, offset: number): (number, {[string]: any})
    local cursor = offset
    local result = {}

    for field, packet_type in self.__info do
        local is_success = false
        local cursor_or_error: number | string = 0

        is_success, cursor_or_error, result[field] = pcall(packet_type.read, from, cursor)

        if not is_success then
            return error(`Packet failed to read {field} field.`)
        end

        cursor = cursor_or_error
    end

    return cursor, result
end

function Packet:create(data: {[string]: any}): buffer
    local result = buffer.create(256)
    local cursor = 0

    cursor = self:write(result, data, cursor)

    return cut_buffer(result, cursor)
end

return Packet
