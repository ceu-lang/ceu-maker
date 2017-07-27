@echo off

set CEU_ISR=false
set ARD_ARCH=avr
set ARD_BOARD=uno
set ARD_PORT=COM3

set CEU_SRC=%1
if exist %CEU_SRC%\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

set PATH=%~dp0\..\mingw\bin

cd %~dp0

lua53.exe ceu.lua --pre --pre-args="-Iceu\include" --pre-input="%CEU_SRC%" --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass --ceu-features-lua=false --ceu-features-thread=false --ceu-features-isr=%CEU_ISR% --env --env-types=ceu\env\arduino\env\types.h --env-output=ceu\env\arduino\env\_ceu_app.c.h
if ERRORLEVEL 1 goto ERROR

..\arduino-1.8.3\arduino.exe --board arduino:%ARD_ARCH%:%ARD_BOARD%%ARD_CPU% --port %ARD_PORT% --upload ceu\env\arduino\env\env.ino
if ERRORLEVEL 1 goto ERROR

exit

:ERROR
pause
