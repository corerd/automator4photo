@echo OFF
rem ############################################################################
rem NAME
rem        exifUpdate - Write lens meta information in files
rem
rem SYNTAX
rem        exifUpdate BASH_SCRIPT [-F VALUE] FILE...
rem
rem DESCRIPTION
rem        Pass the arguments to the provided bash script
rem        in order to add model, aperture, and focal length
rem        when such lens information is not stored by the camera
rem        (i.e. manual lens without chip).
rem
rem ARGUMENTS
rem        BASH_SCRIPT  Any of exifAF50mmUpdate, exifAI20mmUpdate, exifK105mmUpdate
rem        -F VALUE     Aperture (optional; default is lens max value)
rem        FILE...      One or more image file names
rem
rem REQUIRED
rem        Windows Subsystem for Linux (WSL) to provide Bash.exe application.
rem
rem        exiftool by Phil Harvey
rem        See: http://www.sno.phy.queensu.ca/~phil/exiftool/
rem
rem DIAGNOSTICS
rem        This application exits with a status of 0 on success, or 1 if
rem        an error occurred processing one or more image files.
rem
rem ----------------------------------------------------------------------------
rem THE BEER-WARE LICENSE
rem <corerd@live.com> wrote this file. As long as you retain this notice you
rem can do whatever you want with this stuff. If we meet some day, and you think
rem this stuff is worth it, you can buy me a beer in return.
rem ----------------------------------------------------------------------------
rem ############################################################################

rem Move to the current directory
cd %~dp0

if "%~1"=="" goto exit_syntax_error

rem Get first argument as bash script and shift to the next
set "bash_script=./%~1"
shift

rem Parse parameters in batch files at DOS command line
rem See: https://stackoverflow.com/a/14298769
:arg_parse
if "%~1"=="" goto end_arg_parse
if "%~1"=="-F" goto set_FNumber
rem else
goto exifUpdate


:set_FNumber
rem Set F number argument
shift
if "%~1"=="" goto end_arg_parse
set "FNumber=-FNumber=%~1"
goto next_arg


:exifUpdate
rem Convert Windows path for Windows Ubuntu Bash
rem Link: https://superuser.com/a/1113866
set "nixFilePath=%~1"

set "drive=%nixFilePath:~0,1%"

set nixFilePath=%nixFilePath:~2%
set "nixFilePath=%nixFilePath:\=/%"

if %drive%==A set "drive=a"
if %drive%==B set "drive=b"
if %drive%==C set "drive=c"
if %drive%==D set "drive=d"
if %drive%==E set "drive=e"
if %drive%==F set "drive=f"
if %drive%==G set "drive=g"
if %drive%==H set "drive=h"
if %drive%==I set "drive=i"
if %drive%==J set "drive=j"
if %drive%==K set "drive=k"
if %drive%==L set "drive=l"
if %drive%==M set "drive=m"
if %drive%==N set "drive=n"
if %drive%==O set "drive=o"
if %drive%==P set "drive=p"
if %drive%==Q set "drive=q"
if %drive%==R set "drive=r"
if %drive%==S set "drive=s"
if %drive%==T set "drive=t"
if %drive%==U set "drive=u"
if %drive%==V set "drive=v"
if %drive%==W set "drive=w"
if %drive%==X set "drive=x"
if %drive%==Y set "drive=y"
if %drive%==Z set "drive=z"

set "nixFilePath=/mnt/%drive%%nixFilePath%"

echo %nixFilePath%
bash "%bash_script%" %FNumber% "%nixFilePath%"
if errorlevel 1 goto exit_bash_error

goto next_arg


:next_arg
shift
goto arg_parse


:end_arg_parse
goto exit_good


:exit_good
pause
exit /B 0


:exit_syntax_error
echo SYNTAX: exifUpdate BASH_SCRIPT [-F VALUE] FILE...
pause
exit /B 1


:exit_bash_error
echo !!! Bash script reports some errors !!!
pause
exit /B 1
