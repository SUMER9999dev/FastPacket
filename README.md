# 📦 FastPacket
Simple & Fast luau packet library <br/>
Created by SUMER (@sumer_real) for MelonBytes Studio

# ☁️ Installation
**Roblox**: Download from [releases](https://github.com/SUMER9999dev/FastPacket/releases) <br/>
**Wally**:  ``fastpacket = "sumer9999dev/fastpacket@1.0.5"``


# 📖 Documentation

## Packet Types
Packet types is need to create packet <br/>

```lua
-- for integers that can be negative
FastPacket.Types.Number8  -- 8 is bit size (8, 16, 32)
```
  
```lua
-- for integers that can't be negative
FastPacket.Types.NumberU8  -- 8 is bit size (8, 16, 32)
```

```lua
-- for float numbers
FastPacket.Types.Float32  -- 32 is bit size (32, 64)
```

```lua
-- for strings value
FastPacket.Types.String  -- 32 is bit size (32, 64)
```

## Packet
Packet allows to convert strict table structure to buffer and vice versa <br/>

```lua
local packet = FastPacket.Packet.new {
  some_string = FastPacket.Types.String,
  some_number = FastPacket.Types.Number16
}

local result_buffer = packet:create {
  some_string = 'Hello!',
  some_number = 1234
}

print(packet:read(result_buffer, 0))  --> 12, {some_string = "Hello!", some_number = 1234}  : first number is packet size in bytes
```

## Stream
Stream is high level class that allows to bundle many packets into one buffer <br/>

```lua
local packet = ...
local stream = FastPacket.Stream.new(8192, { packet })  -- 8192 is max stream size in bytes, second is table of supported packets

stream:append(packet, {some_string = 'Hello!', some_number = 1234})  -- appends new packet inside stream
stream:append(packet, {some_string = 'Another string!', some_number = 5678})

local result = stream:flush()  -- will clean stream and return all collected packets inside one buffer
print(stream:read(result))

--[[
  will read stream buffer, print outputs:
  {
    [packet] = {
      {some_string = 'Hello!', some_number = 1234},
      {some_string = 'Another string!', some_number = 5678}
    }
  }
]]
```