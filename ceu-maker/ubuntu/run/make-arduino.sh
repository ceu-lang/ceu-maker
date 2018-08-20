cd $PWD/../repos/ceu-arduino/

CEU_SRC=$1

if [ -f $CEU_SRC/main.ceu ]; then
	CEU_SRC = $CEU_SRC/main.ceu
fi

make -f Makefile CEU_SRC_=$CEU_SRC