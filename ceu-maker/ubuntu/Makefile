USERNAME = $(shell whoami)

all: sdl icos permissions lua dialout

sdl:
	sudo apt-get install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl2-net-dev libsdl2-gfx-dev

icos:
	xdg-icon-resource install --context apps --size 256 icos/star_256.png ceu-star
	xdg-icon-resource install --context apps --size 256 icos/ceu-arduino.png ceu-arduino

permissions:
	chmod +x bin/pico-ceu.desktop
	chmod +x bin/ceu-arduino.desktop

lua:
	cd run/lua/ && make clean
	cd run/lua/ && make linux test

dialout:
	sudo usermod -a -G dialout $(USERNAME)

.PHONY: sdl icos permissions lua dialout
