local LuauClass = require(script.Parent.LuauClass)


export type PacketType<T> = {
    write: (source: buffer, offset: number, data: T) -> number,
    read: (source: buffer, offset: number) -> (number, T)
}


type PacketMethods = {
    write: (self: Packet, to: buffer, data: {[string]: any}, offset: number) -> number,
    read: (self: Packet, from: buffer, offset: number) -> (number, {[string]: any}),

    create: (self: Packet, data: {[string]: any}) -> buffer
}
export type Packet = LuauClass.Class<PacketMethods, {__info: {[string]: PacketType<any>}}, {[string]: PacketType<any>}>


type PacketStreamMethods = {
    append: (self: PacketStream, packet: Packet, data: {[string]: any}) -> (),

    flush: (self: PacketStream) -> buffer,
    read: (self: PacketStream, source: buffer) -> ({[Packet]: { {[string]: any} }})
}
type PacketStreamImplementation = {
    __stream: buffer,

    __reversed_packet_map: {[Packet]: number},
    __packet_map: {Packet},

    __cursor: number
}
export type PacketStream = LuauClass.Class<PacketStreamMethods, PacketStreamImplementation, number, {Packet}>


return {}