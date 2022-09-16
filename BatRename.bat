@Echo off
mode con cols=80 lines=30 & color 07

:Interface
Cls
ECHO ---------------------------------------
ECHO Option
ECHO ---------------------------------------
ECHO 1.Rename by number only
ECHO 2.Rename by Character and number
ECHO.
ECHO Q.quit
ECHO.


:Choose
if exist %cd%\src.txt (del %cd%\src.txt)
Set /p a=Input Number:
if "%a%"=="1" goto :Number
if "%a%"=="2" goto :Character
if /I "%a%"=="Q" goto : Escape
Echo Invalid
pause
Goto :Choose

:Number
Set /p csuffix=CurrentSuffix:
Set /p nsuffix=NewSuffix:
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir /s/b *.*') do (
    set "foo=%%~nxi"
    set foo=!foo: =!
    set foo=!foo: =!
    ren "%%~fi" "!foo!"
)
dir /a-d /b *.%csuffix%>src.txt
setlocal enabledelayedexpansion
set /a a=0
@for  /f %%s in (src.txt) do (
set /a a+=1
if !a! lss 10 (rename %%s 000!a!.%nsuffix%)
if !a! geq 10 if !a! lss 100 (rename %%s 00!a!.%nsuffix%)
if !a! geq 100 if !a! lss 1000 (rename %%s 0!a!.%nsuffix%)
if !a! geq 1000 (rename %%s !a!.%nsuffix%)
)
echo success£¡
pause
Goto :Interface

:Character
Set /p csuffix=CurrentSuffix:
Set /p nsuffix=NewSuffix:
Set /p x=CharacterIntheFront:
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir /s/b *.*') do (
    set "foo=%%~nxi"
    set foo=!foo: =!
    set foo=!foo: =!
    ren "%%~fi" "!foo!"
)
dir /a-d /b *.%csuffix%>src.txt
setlocal enabledelayedexpansion
set /a a=0
@for  /f %%s in (src.txt) do (
set /a a+=1
if !a! lss 10 (rename %%s %x%_000!a!.%nsuffix%)
if !a! geq 10 if !a! lss 100 (rename %%s %x%_00!a!.%nsuffix%)
if !a! geq 100 if !a! lss 1000 (rename %%s %x%_0!a!.%nsuffix%)
if !a! geq 1000 (rename %%s %x%!a!.%nsuffix%)
)
echo success£¡
pause
Goto :Interface

:Escape exit
