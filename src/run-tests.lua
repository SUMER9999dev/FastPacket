local runCLI = require(game.ReplicatedStorage.Packages.Jest).runCLI

_G.NOCOLOR = true

local status, result = runCLI(
    game.ReplicatedStorage.FastPacket,
    {
        verbose = false,
	    ci = false
    },
    {game.ReplicatedStorage.FastPacket}
):awaitStatus()


if status == 'Rejected' then
	print(result)
end
