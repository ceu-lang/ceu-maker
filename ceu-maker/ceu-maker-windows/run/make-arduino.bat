@echo off

for %%i IN ("%1") do (set fileextension=%%~xi)

rem if we're trying to compile a folder
if "%fileextension%"=="" (
    set boardPath=%1\board.conf
) else (
    set boardPath=board.conf
)

rem https://stackoverflow.com/questions/206114/batch-files-how-to-read-a-file
for /f "tokens=1-4" %%a in (%boardPath%) do (
    rem try to use the project conf file
    set e=%%a
    set f=%%b
    set g=%%c
    set h=%%d
)

rem if the project conf file is empty
if "%e%" == "" ( 
    for /f "tokens=1-4" %%a in (%~dp0board.conf) do (
        rem try to use the global conf file
        set e=%%a
        set f=%%b
        set g=%%c
        set h=%%d
    )
)

rem if the global conf file is empty
if "%e%" == "" ( 
    rem https://stackoverflow.com/questions/11153532/how-to-iterate-string-in-cmd-for-loop
    for /f "tokens=1-4" %%a in ('%~dp0../bin/SelectDevice.exe %1') do (
        rem the user choosed a board from the list
        rem this board will be saved as a project conf file
        set e=%%a
        set f=%%b
        set g=%%c
        set h=%%d
    )
)

if "%e%" == "" ( 
    echo No board selected. Select a board using SelectDevice or edit the board.conf file.
) else (
    cd %~dp0\..\repos\ceu-arduino\
    ..\..\mingw\bin\make -f Makefile CEU_SRC=%1 ARD_BOARD=%e% ARD_PORT=%f% ARD_CPU=%g% ARD_MCU=%h%
)
pause