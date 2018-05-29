rem @echo off
cd %~dp0\..\repos\ceu-arduino\
..\..\mingw\bin\make -f Makefile CEU_SRC=%1
pause
