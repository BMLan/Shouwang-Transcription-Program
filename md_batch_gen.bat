@setlocal enabledelayedexpansion
@echo off

set /p vol=Type in volume name:
set /p ch=Type in chapter amount:

set folder_name="vol_%vol%"
md %folder_name%
echo Folder %folder_name% created.

set file_name=
cd %folder_name%
for /l %%i in (1,1,%ch%) do (
    if %%i LSS 10 (
        set file_name="VOL%vol%_CH0%%i.md"
    ) else if %%i GEQ 10 (
        set file_name="VOL%vol%_CH%%i.md"
    )
    type NUL > !file_name!
    echo File !file_name! Created.
)

pause