LUA = ${CURDIR}/ceu-maker/run/lua53.exe
BRANCH = pre-v0.40

all: clean dirs repos ceu arduino sdl pico winrar

clean:
	rm -Rf ceu-maker/docs/
	rm -Rf ceu-maker/run/ceu/
	rm -Rf ceu-maker/samples/ceu-arduino/
	rm -Rf ceu-maker/samples/pico-ceu/
	rm -Rf ceu-maker/dist/

dirs:
	mkdir -p repos/
	mkdir -p releases/
	mkdir -p ceu-maker/docs/
	mkdir -p ceu-maker/run/ceu/include/
	mkdir -p ceu-maker/run/ceu/env/
	mkdir -p ceu-maker/run/ceu/env/arduino/
	mkdir -p ceu-maker/samples/
	mkdir -p ceu-maker/samples/ceu-arduino/ 
	mkdir -p ceu-maker/samples/pico-ceu/

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
	cp repos/ceu/env/*                           ceu-maker/run/ceu/env/
	cp repos/ceu/include/c.ceu                   ceu-maker/run/ceu/include/
	cp repos/ceu/docs/manual/v0.30/ceu-v0.30.pdf ceu-maker/docs/
	cd repos/ceu/src/lua && $(LUA) pak.lua lua5.3
	cp repos/ceu/src/lua/ceu ceu-maker/run/ceu.lua
	
arduino:
	cp repos/ceu-arduino/docs/manual/v0.20/ceu-arduino-v0.20.pdf ceu-maker/docs/
	#cp repos/ceu-arduino/docs/manual/v0.30/ceu-arduino-v0.30.pdf ceu-maker/docs/
	cp -Rf repos/ceu-arduino/samples/*           ceu-maker/samples/ceu-arduino/
	cp -Rf repos/ceu-arduino/include/arduino/    ceu-maker/run/ceu/include/
	cp -Rf repos/ceu-arduino/env/                ceu-maker/run/ceu/env/arduino/

sdl:
	cp -Rf repos/ceu-sdl/include/sdl/            ceu-maker/run/ceu/include/

pico:
	cp repos/pico-ceu/docs/manual/v0.30/pico-ceu-v0.30.pdf ceu-maker/docs/
	cp -Rf repos/pico-ceu/samples/*              ceu-maker/samples/pico-ceu/
	cp -Rf repos/pico-ceu/include/pico/          ceu-maker/run/ceu/include/
	cp repos/pico-ceu/pico.ceu                   ceu-maker/run/ceu/

winrar:
	WinRAR/WinRAR.exe a -zWinRAR/setup_comment.txt -r -sfx -iiconceu-maker/cib_192.ico releases/ceu-maker.exe "ceu-maker/*"

.PHONY: clean dirs repos ceu arduino sdl pico winrar
