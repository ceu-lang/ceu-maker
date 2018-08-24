USERNAME = $(shell whoami)

all: ceu-dependencies sdl icos desktopx dialout

ceu-dependencies:
	sudo apt-get install git lua5.3 lua-lpeg liblua5.3-0 liblua5.3-dev

sdl:
	sudo apt-get install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libsdl2-net-dev libsdl2-gfx-dev

icos:
	xdg-desktop-icon install --size 48 icos/star_256.png
	xdg-desktop-icon install --size 48 icos/ceu-arduino.png

desktopx:
	chmod +x bin/pico-ceu.desktop
	chmod +x bin/ceu-arduino.desktop

dialout:
	# Solve the error avrdude: ser_open(): can't open device "/dev/ttyACM0": Permission denied
	sudo usermod -a -G dialout $(USERNAME)
	sudo chmod a+rw /dev/ttyACM0

.PHONY: ceu-dependencies sdl icons desktopx dialout
