local Float32 = require(script.Float32)
local Float64 = require(script.Float64)

local NumberU8 = require(script.NumberU8)
local NumberU16 = require(script.NumberU16)
local NumberU32 = require(script.NumberU32)

local Number8 = require(script.Number8)
local Number16 = require(script.Number16)
local Number32 = require(script.Number32)

local String = require(script.String)


return {
    Number8 = Number8,
    Number16 = Number16,
    Number32 = Number32,

    NumberU8 = NumberU8,
    NumberU16 = NumberU16,
    NumberU32 = NumberU32,

    Float32 = Float32,
    Float64 = Float64,

    String = String
}
