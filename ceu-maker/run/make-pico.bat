rem @echo off

cd %~dp0\..\repos\pico-ceu\

set CEU_SRC=%~1

if exist "%CEU_SRC%"\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

mkdir %CEU_DIR%\dist\ 2>NUL
mkdir %CEU_DIR%\dist\res\ 2>NUL
copy ..\..\run\dist\*.* %CEU_DIR%\dist\ >NUL
copy %CEU_DIR%\res\*.* %CEU_DIR%\dist\res\ >NUL

echo CEU_DIR in batch: %CEU_DIR%

..\..\mingw\bin\make -f Makefile CEU_SRC=%1 CEU_SRC_DIR="%CEU_DIR%

pause
