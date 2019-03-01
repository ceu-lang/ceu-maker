rem @echo off

rem https://stackoverflow.com/questions/206114/batch-files-how-to-read-a-file
for /f "tokens=1-4" %%a in (board.conf) do (
    rem try to use the conf file
    set e=%%a
    set f=%%b
    set g=%%c
    set h=%%d
)

rem if the conf file is empty
if "%e%" == "" ( 
    rem https://stackoverflow.com/questions/11153532/how-to-iterate-string-in-cmd-for-loop
    for /f "tokens=1-4" %%a in ('%~dp0SelectDevice.exe') do (
        rem the user choosed a board from the list
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