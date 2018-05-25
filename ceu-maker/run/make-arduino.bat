@echo off

setlocal EnableDelayedExpansion

set CEU_ISR=false

for /f %%a in ('%~dp0/SelectDevice.exe') do set "returnvalue=%%a"

set ARD_BOARD = ""
set ARD_PORT  = ""

for /f "tokens=1,2,3 delims=, " %%a in ("%returnvalue%") do (
   set "ARD_BOARD=--board arduino:avr:%%a%%c"
   set "ARD_PORT=--port %%b"
)

echo !ARD_BOARD!
echo !ARD_PORT!

set CEU_SRC=%1
if exist %CEU_SRC%\main.ceu set CEU_SRC=%CEU_SRC%\main.ceu
for %%A in ("%CEU_SRC%") do (
    set CEU_DIR=%%~dpA
)

set PATH=%~dp0\..\mingw\bin

cd %~dp0

lua53.exe ceu.lua --pre --pre-args="-Iceu\include -DCEUMAKER_ARDUINO" --pre-input="%CEU_SRC%" --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass --ceu-features-lua=false --ceu-features-thread=false --ceu-features-isr=%CEU_ISR% --env --env-types=ceu\env\arduino\env\types.h --env-output=ceu\env\arduino\env\_ceu_app.c.h
if ERRORLEVEL 1 goto ERROR

..\arduino-1.8.3\arduino_debug.exe !ARD_BOARD! !ARD_PORT! --upload ceu\env\arduino\env\env.ino
if ERRORLEVEL 1 goto ERROR

exit

:ERROR
pause
