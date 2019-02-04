cd $PWD/../repos/pico-ceu/

CEU_SRC_=$1

if [ -f $CEU_SRC_/main.ceu ]; then
    CEU_SRC_ = $CEU_SRC_/main.ceu
fi

CEU_DIR=`dirname $CEU_SRC_`

mkdir -p $CEU_DIR/dist
mkdir -p $CEU_DIR/dist/res
cp ../../run/dist/*.* $CEU_DIR/dist/
cp $CEU_DIR/res/*.* $CEU_DIR/dist/res/

echo $CEU_SRC_
echo $CEU_DIR

echo $PWD
make -f Makefile CEU_SRC=$CEU_SRC_ CEU_SRC_DIR=$CEU_DIR