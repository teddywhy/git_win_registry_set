@echo off

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\shell\git_gui
REM ############################################################
echo Remove HKEY_CLASSES_ROOT\Directory\shell\git_gui

reg delete HKCR\Directory\shell\git_gui /f     

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui
REM ############################################################
echo HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui

reg delete HKCR\Directory\Background\shell\git_gui  /f

