rem @echo off
cd %~dp0\..\repos\ceu-arduino\

rem https://stackoverflow.com/questions/11153532/how-to-iterate-string-in-cmd-for-loop
for /f "tokens=1-3" %%a in ('%~dp0SelectDevice.exe') do (

    if NOT "%%a" == "" ( 
        rem the user didn't close the SelectDevice.exe using the 'X' from the window

        if "%%a" == "ide" (
            rem the user choosed to use the IDE configurations
            ..\..\mingw\bin\make -f Makefile CEU_SRC=%1 IDE=t
        ) else (
            rem the user choosed a board from the list
            ..\..\mingw\bin\make -f Makefile CEU_SRC=%1 ARD_BOARD=%%a ARD_PORT=%%b ARD_CPU=%%c ARD_MCU=%%d
        )

        pause
    )
)