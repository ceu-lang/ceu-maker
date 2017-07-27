CEU_DIR         = $(error set absolute path to "<ceu>" repository)
CEU_ARDUINO_DIR = $(error set absolute path to "<ceu-arduino>" repository)
CEU_SDL_DIR     = $(error set absolute path to "<ceu-sdl>" repository)
CEU_PICO_DIR    = $(error set absolute path to "<pico-ceu>" repository)

all: ceu arduino sdl pico

ceu:
	mkdir -p ceu-maker/run/ceu/env/
	mkdir -p ceu-maker/run/ceu/include/
	mkdir -p ceu-maker/samples/
	cp $(CEU_DIR)/env/*                           ceu-maker/run/ceu/env/
	cp $(CEU_DIR)/include/c.ceu                   ceu-maker/run/ceu/include/
	cp $(CEU_DIR)/docs/manual/v0.30/ceu-v0.30.pdf ceu-maker/docs/
	cp /usr/local/bin/ceu                         ceu-maker/run/ceu.lua

arduino:
	#cp $(CEU_ARDUINO_DIR)/docs/manual/v0.30/ceu-arduino-v0.30.pdf ceu-maker/docs/
	cp -Rf $(CEU_ARDUINO_DIR)/samples/            ceu-maker/samples/ceu-arduino
	cp -Rf $(CEU_ARDUINO_DIR)/include/arduino/    ceu-maker/run/ceu/include/
	cp -Rf $(CEU_ARDUINO_DIR)/env/                ceu-maker/run/ceu/env/arduino/

sdl:
	cp -Rf $(CEU_SDL_DIR)/include/sdl/            ceu-maker/run/ceu/include/

pico:
	cp $(CEU_PICO_DIR)/docs/manual/v0.30/pico-ceu-v0.30.pdf ceu-maker/docs/
	cp -Rf $(CEU_PICO_DIR)/samples/               ceu-maker/samples/pico-ceu
	cp -Rf $(CEU_PICO_DIR)/include/pico/          ceu-maker/run/ceu/include/
	cp $(CEU_PICO_DIR)/pico.ceu                   ceu-maker/run/ceu/

.PHONY: ceu arduino sdl pico
