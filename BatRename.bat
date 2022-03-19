@Echo off
mode con cols=80 lines=30 & color 0a

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
Pause
Goto :Choose

:Number
dir /a-d /b *.png>src.txt
setlocal enabledelayedexpansion
set /a a=0
@for  /f %%s in (src.txt) do (
set /a a+=1
rename %%s 000!a!.png
)
echo success£¡
pause
Goto :Interface

:Character
Set /p x=CharacterIntheFront:
dir /a-d /b *.png>src.txt
setlocal enabledelayedexpansion
set /a a=0
@for  /f %%s in (src.txt) do (
set /a a+=1
rename %%s %x%_000!a!.png
)
echo success£¡
pause
Goto :Interface

:Escape exit
