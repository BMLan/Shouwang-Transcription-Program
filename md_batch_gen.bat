@setlocal enabledelayedexpansion
@echo off

:: 读入册号、章节总数
set /p vol=Type in volume name:
set /p ch=Type in chapter amount:

:: 在根目录下创建册号对应的文件夹
set folder_name="vol_%vol%"
md %folder_name%
echo Folder %folder_name% Created.

:: 声明空白变量记录文件名，进入创建的文件夹
set file_name=
cd %folder_name%

:: 批量创建空白md文档
for /l %%i in (1,1,%ch%) do (
    :: 章节号为1位时，补齐1位前导零
    if %%i LSS 10 (
        set file_name="VOL%vol%_CH0%%i.md"
    :: 章节号为2位时，正常创建文件
    ) else if %%i GEQ 10 (
        set file_name="VOL%vol%_CH%%i.md"
    )
    type NUL > !file_name!
    echo File !file_name! Created.
)

pause