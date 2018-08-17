cd $PWD/../repos/pico-ceu/

CEU_SRC=$1

if [ -f $CEU_SRC/main.ceu ]; then
	CEU_SRC = $CEU_SRC/main.ceu
fi

CEU_DIR=`dirname $CEU_SRC`

echo $CEU_SRC
echo $CEU_DIR

mkdir $CEU_DIR/dist/
mkdir $CEU_DIR/dist/res/

cp ../../run/dist/*.* $CEU_DIR/dist/
cp $CEU_DIR/res/*.* $CEU_DIR/dist/res/

echo $PWD
make -f Makefile CEU_SRC_=$CEU_SRC CEU_SRC_DIR=$CEU_DIR