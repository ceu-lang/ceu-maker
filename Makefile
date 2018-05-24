include Makefile.conf

LUA = ${CURDIR}/ceu-maker/run/lua53.exe

all: ceu arduino sdl pico winrar

ceu:
	mkdir -p ceu-maker/run/ceu/env/
	mkdir -p ceu-maker/run/ceu/include/
	mkdir -p ceu-maker/samples/
	mkdir -p ceu-maker/docs/

	cp $(CEU_DIR)/env/*                           ceu-maker/run/ceu/env/
	cp $(CEU_DIR)/include/c.ceu                   ceu-maker/run/ceu/include/
	cp $(CEU_DIR)/docs/manual/v0.30/ceu-v0.30.pdf ceu-maker/docs/
	
	cd $(CEU_DIR)/src/lua && $(LUA) pak.lua lua5.3
	cp $(CEU_DIR)/src/lua/ceu ceu-maker/run/ceu.lua
	
arduino:
	cp $(CEU_ARDUINO_DIR)/docs/manual/v0.20/ceu-arduino-v0.20.pdf ceu-maker/docs/
	#cp $(CEU_ARDUINO_DIR)/docs/manual/v0.30/ceu-arduino-v0.30.pdf ceu-maker/docs/

	rm -Rf ceu-maker/samples/ceu-arduino/
	mkdir -p ceu-maker/samples/ceu-arduino/ 
	cp -Rf $(CEU_ARDUINO_DIR)/samples/*            ceu-maker/samples/ceu-arduino/
	cp -Rf $(CEU_ARDUINO_DIR)/include/arduino/    ceu-maker/run/ceu/include/
	rm -Rf ceu-maker/run/ceu/env/arduino/
	mkdir ceu-maker/run/ceu/env/arduino/
	cp -Rf $(CEU_ARDUINO_DIR)/env/                ceu-maker/run/ceu/env/arduino/

sdl:
	cp -Rf $(CEU_SDL_DIR)/include/sdl/            ceu-maker/run/ceu/include/

pico:
	cp $(CEU_PICO_DIR)/docs/manual/v0.30/pico-ceu-v0.30.pdf ceu-maker/docs/
	rm -Rf ceu-maker/samples/pico-ceu/
	mkdir -p ceu-maker/samples/pico-ceu/
	cp -Rf $(CEU_PICO_DIR)/samples/*               ceu-maker/samples/pico-ceu/
	cp -Rf $(CEU_PICO_DIR)/include/pico/          ceu-maker/run/ceu/include/
	cp $(CEU_PICO_DIR)/pico.ceu                   ceu-maker/run/ceu/

winrar:
	mkdir -p releases
	$(WINRAR_EXE) a -zWinRAR/setup_comment.txt -r -sfx -iiconceu-maker/cib_192.ico releases/ceu-maker.exe "ceu-maker/*"

.PHONY: ceu arduino sdl pico winrar
