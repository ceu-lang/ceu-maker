cd $PWD/../repos/pico-ceu/

CEU_SRC=$1

if [ -f $CEU_SRC/main.ceu ]; then
	CEU_SRC = $CEU_SRC/main.ceu
fi

CEU_DIR=~/ceu-maker

mkdir -p $CEU_DIR/dist/
mkdir -p $CEU_DIR/dist/res/

cp ../../run/dist/*.* $CEU_DIR/dist/
cp `dirname $CEU_SRC`/res/*.* $CEU_DIR/dist/res/

make -f Makefile CEU_SRC_=$CEU_SRC CEU_SRC_DIR=$CEU_DIR
