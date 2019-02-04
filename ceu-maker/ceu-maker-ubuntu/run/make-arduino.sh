cd $PWD/../repos/ceu-arduino/

CEU_SRC_=$1

if [ -f $CEU_SRC_/main.ceu ]; then
	CEU_SRC_ = $CEU_SRC_/main.ceu
fi

ARD_ARCH=avr
ARD_BOARD=uno
ARD_PORT=/dev/ttyACM0
ENV_=$HOME/ceu-maker/env

mkdir -p ~/ceu-maker/
mkdir -p ~/ceu-maker/env/

cp env/*.* ~/ceu-maker/env/

make -f Makefile CEU_SRC=$CEU_SRC_ ARD_ARCH_=$ARD_ARCH ARD_BOARD_=$ARD_BOARD ARD_PORT_=$ARD_PORT ENV=$ENV_
