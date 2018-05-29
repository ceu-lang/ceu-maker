@echo off

set CEU_SRC=%1
if exist %CEU_SRC%\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

mkdir %CEU_DIR%\dist\ 2>NUL
mkdir %CEU_DIR%\dist\res\ 2>NUL
copy dist\*.* %CEU_DIR%\dist\ >NUL
copy %CEU_DIR%\res\*.* %CEU_DIR%\dist\res\ >NUL
copy res\*.* %CEU_DIR%\dist\res\ >NUL

..\mingw\bin\make -f ../repos/pico-ceu/Makefile CEU_SRC=%1

pause
