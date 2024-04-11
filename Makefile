PROJECT = test.project.json
PACKAGES = DevPackages/
OUTPUT = FastPacket.rbxlx
RUN_TESTS = src/run-tests.lua


all: build run

sourcemap:
	wally install
	rojo sourcemap $(PROJECT) --output sourcemap.json
	wally-package-types --sourcemap sourcemap.json $(PACKAGES)

build:
	rojo build --output $(OUTPUT)

run:
	run-in-roblox --place $(OUTPUT) --script $(RUN_TESTS)
