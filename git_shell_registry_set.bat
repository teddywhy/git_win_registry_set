@echo off

set CURRENT_PATH=%cd%

cd %1

set GIT_PATH=%cd%

set GIT_BASH=%GIT_PATH%\git-bash.exe

echo GIT_PATH=%GIT_PATH%
echo GIT_BASH=%GIT_BASH%

if not exist %GIT_BASH% goto ERROR

REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\shell\git_shell
REM ############################################################
echo HKEY_CLASSES_ROOT\Directory\shell\git_shell

reg add HKCR\Directory\shell\git_shell         /t REG_SZ /f /d "Git Ba&sh Here"

reg add HKCR\Directory\shell\git_shell -v Icon /t REG_SZ /f /d "\"%GIT_BASH%\""

reg add HKCR\Directory\shell\git_shell\command /t REG_SZ /f /d "\"%GIT_BASH%\" \"--cd=%%1\""


REM ############################################################
REM # HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell
REM ############################################################
echo HKEY_CLASSES_ROOT\Directory\Background\shell\git_shell

reg add HKCR\Directory\Background\shell\git_shell         /t REG_SZ /f /d "Git Ba&sh Here"

reg add HKCR\Directory\Background\shell\git_shell -v Icon /t REG_SZ /f /d "\"%GIT_BASH%\""

reg add HKCR\Directory\Background\shell\git_shell\command /t REG_SZ /f /d "\"%GIT_BASH%\" \"--cd=%%v.\""

goto END

:ERROR
echo ERROR: %GIT_BASH% not found.
echo USAGE: %0 ^<git_installation_path^>

:END
cd %CURRENT_PATH%
