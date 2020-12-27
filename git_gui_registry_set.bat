@echo off

set CURRENT_PATH=%cd%

cd %1

set GIT_PATH=%cd%

set GIT_GUI=%GIT_PATH%\cmd\git-gui.exe

echo GIT_PATH=%GIT_PATH%
echo GIT_GUI=%GIT_GUI%

if not exist %GIT_GUI% goto ERROR

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\shell\git_gui
REM ############################################################
echo HKEY_CLASSES_ROOT\Directory\shell\git_gui

reg add HKCR\Directory\shell\git_gui         /t REG_SZ /f /d "Git &GUI Here"

reg add HKCR\Directory\shell\git_gui -v Icon /t REG_SZ /f /d "\"%GIT_GUI%\""

reg add HKCR\Directory\shell\git_gui\command /t REG_SZ /f /d "\"%GIT_GUI%\" \"--working-dir\" \"%%1\""


REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui
REM ############################################################
echo HKEY_CLASSES_ROOT\Directory\Background\shell\git_gui

reg add HKCR\Directory\Background\shell\git_gui         /t REG_SZ /f /d "Git &GUI Here"

reg add HKCR\Directory\Background\shell\git_gui -v Icon /t REG_SZ /f /d "\"%GIT_GUI%\""

reg add HKCR\Directory\Background\shell\git_gui\command /t REG_SZ /f /d "\"%GIT_GUI%\" \"--working-dir\" \"%%v.\""

goto END

:ERROR
echo ERROR: %GIT_BASH% not found.
echo USAGE: %0 ^<git_installation_path^>

:END
cd %CURRENT_PATH%
