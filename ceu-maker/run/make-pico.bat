@echo off

set CEU_SRC=%1
if exist %CEU_SRC%\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

set PATH=%~dp0\..\mingw\bin
cd %~dp0

mkdir %CEU_DIR%\dist\ 2>NUL
mkdir %CEU_DIR%\dist\res\ 2>NUL
copy dist\*.* %CEU_DIR%\dist\ >NUL
copy %CEU_DIR%\res\*.* %CEU_DIR%\dist\res\ >NUL
copy res\*.* %CEU_DIR%\dist\res\ >NUL

lua53.exe ceu.lua --pre --pre-args="-Iceu\include -DCEU_SRC=%CEU_SRC% -DCEUMAKER_PICO" --pre-input="ceu\pico.ceu" --ceu --ceu-features-pool=true --ceu-features-dynamic=true --ceu-features-async=true --ceu-features-os=true --ceu-features-trace=true --ceu-err-unused=pass --ceu-err-uninitialized=pass --env --env-types=ceu\env\types.h --env-main=ceu\env\main.c --cc --cc-args="-Ic\include -Lc\lib -lm -lmingw32 -lSDL2main -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_net" --cc-output=%CEU_DIR%\dist\tmp.exe
if ERRORLEVEL 1 goto ERROR

cd %CEU_DIR%\dist\
tmp.exe
if ERRORLEVEL 1 goto ERROR
exit

:ERROR
pause
