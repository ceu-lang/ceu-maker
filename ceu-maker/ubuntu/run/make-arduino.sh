cd $PWD/../repos/ceu-arduino/

CEU_SRC_=$1

if [ -f $CEU_SRC_/main.ceu ]; then
	CEU_SRC_ = $CEU_SRC_/main.ceu
fi

ARD_ARCH=avr
ARD_BOARD=uno
ARD_PORT=/dev/ttyACM0

make -f Makefile CEU_SRC=$CEU_SRC_ ARD_ARCH_=$ARD_ARCH ARD_BOARD_=$ARD_BOARD ARD_PORT_=$ARD_PORT