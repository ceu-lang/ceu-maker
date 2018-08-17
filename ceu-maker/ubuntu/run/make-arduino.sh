cd $PWD/../repos/ceu-arduino/

CEU_SRC_=$1

if [ -f $CEU_SRC_/main.ceu ]; then
	CEU_SRC = $CEU_SRC_/main.ceu
fi

echo $CEU_SRC_
echo $PWD
make -f Makefile CEU_SRC=$CEU_SRC_ ARD_BOARD="avr" ARD_PORT="/dev/ttyACM*" 