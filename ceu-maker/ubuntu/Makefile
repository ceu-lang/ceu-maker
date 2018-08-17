all: ceu-dependencies sdl icos 

ceu-dependencies:
	sudo apt-get install git lua5.3 lua-lpeg liblua5.3-0 liblua5.3-dev

sdl:
	sudo apt-get install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl2-net-dev libsdl2-gfx-dev

icos:
	xdg-desktop-icon install --size 48 icos/star_256.png
	xdg-desktop-icon install --size 48 icos/ceu-arduino.png

.PHONY: ceu-dependencies sdl icons  
