LUA = ./ceu-maker/run/lua53.exe
BRANCH = pre-v0.40

all: clean dirs repos ceu arduino sdl pico winrar

clean:
	rm -Rf ceu-maker/docs/
	rm -Rf ceu-maker/repos/
	rm -Rf ceu-maker/examples/ceu-arduino/
	rm -Rf ceu-maker/examples/pico-ceu/
	rm -Rf ceu-maker/dist/
	rm -f ceu-maker/run/ceu.lua

dirs:
	mkdir -p repos/
	mkdir -p releases/
	mkdir -p ceu-maker/docs/
	mkdir -p ceu-maker/repos/ceu-arduino/
	mkdir -p ceu-maker/repos/ceu-arduino/env/
	mkdir -p ceu-maker/repos/ceu-arduino/include/
	mkdir -p ceu-maker/repos/ceu-arduino/libraries/
	mkdir -p ceu-maker/repos/pico-ceu/
	mkdir -p ceu-maker/repos/pico-ceu/env/
	mkdir -p ceu-maker/repos/pico-ceu/include/
	mkdir -p ceu-maker/examples/
	mkdir -p ceu-maker/examples/ceu-arduino/
	mkdir -p ceu-maker/examples/pico-ceu/

repos:
	-git clone https://github.com/ceu-lang/ceu         repos/ceu
	-git clone https://github.com/ceu-lang/ceu-arduino repos/ceu-arduino
	-git clone https://github.com/ceu-lang/ceu-sdl     repos/ceu-sdl
	-git clone https://github.com/ceu-lang/pico-ceu    repos/pico-ceu
	cd repos/ceu/         && git pull && git checkout $(BRANCH)
	cd repos/ceu-arduino/ && git pull && git checkout $(BRANCH)
	cd repos/ceu-sdl/     && git pull && git checkout $(BRANCH)
	cd repos/pico-ceu/    && git pull && git checkout $(BRANCH)
	cd repos/ceu-arduino/libraries/ && make clone

ceu:
	cp -Rf repos/ceu/env/*                       ceu-maker/repos/pico-ceu/env/
	cp -Rf repos/ceu/include/*                   ceu-maker/repos/ceu-arduino/include/
	cp -Rf repos/ceu/include/*                   ceu-maker/repos/pico-ceu/include/
	cp repos/ceu/docs/manual/v0.30/ceu-v0.30.pdf ceu-maker/docs/
	cd repos/ceu/src/lua && $(LUA) pak.lua lua5.3
	cp repos/ceu/src/lua/ceu                     ceu-maker/run/ceu.lua
	
arduino:
	cp repos/ceu-arduino/docs/manual/v0.20/ceu-arduino-v0.20.pdf ceu-maker/docs/
	#cp repos/ceu-arduino/docs/manual/v0.30/ceu-arduino-v0.30.pdf ceu-maker/docs/
	cp     repos/ceu-arduino/Makefile            ceu-maker/repos/ceu-arduino/
	cp     ceu-maker/run/make-arduino.conf       ceu-maker/repos/ceu-arduino/Makefile.conf
	cp -Rf repos/ceu-arduino/env/*               ceu-maker/repos/ceu-arduino/env/
	cp -Rf repos/ceu-arduino/include/*           ceu-maker/repos/ceu-arduino/include/
	cp -Rf repos/ceu-arduino/libraries/*         ceu-maker/repos/ceu-arduino/libraries/
	cp -Rf repos/ceu-arduino/examples/*          ceu-maker/examples/ceu-arduino/

sdl:
	cp -Rf repos/ceu-sdl/include/*               ceu-maker/repos/pico-ceu/include/

pico:
	cp repos/pico-ceu/docs/manual/v0.30/pico-ceu-v0.30.pdf ceu-maker/docs/
	cp -Rf repos/pico-ceu/examples/*             ceu-maker/examples/pico-ceu/
	cp -Rf repos/pico-ceu/include/*              ceu-maker/repos/pico-ceu/include/
	cp repos/pico-ceu/pico.ceu                   ceu-maker/repos/pico-ceu/

winrar:
	WinRAR/WinRAR.exe a -zWinRAR/setup_comment.txt -r -sfx -iiconceu-maker/cib_192.ico releases/ceu-maker.exe "ceu-maker/*"

.PHONY: clean dirs repos ceu arduino sdl pico winrar
