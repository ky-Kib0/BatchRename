setlocal enabledelayedexpansion
set /a a=0
@for  /f %%s in (src.txt) do (
set /a a+=1
rename %%s 000!a!.png
)
echo success！
pause
