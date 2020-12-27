@echo off

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\shell\git_shell
REM ############################################################
echo Remove HKEY_CLASSES_ROOT\Directory\shell\git_shell

reg delete HKCR\Directory\shell\git_shell /f

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell
REM ############################################################
echo Remove HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell

reg delete HKCR\Directory\Background\shell\git_shell /f
