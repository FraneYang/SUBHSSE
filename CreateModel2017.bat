@echo off
REM ---------------
REM 发布包生成工具
REM 执行此文件前请先用Release生成WebOA项目
REM --------------



REM --------------
REM 环境变量设置 Project_Src为如WebOA这样的分支
REM --------------
set PROJECT_SRC=%CD%
cd..

REM 源代码Model项目文件夹
set Model_ROOT=%PROJECT_SRC%\SUBHSSE\Model


REM --------------
REM 发布程序包文件夹相关
REM --------------




@echo 设置.net控制台环境
@echo.
@call "%VS150%"

SqlMetal /views  /server:. /database:SUBHSSEDB_7 /code:%Model_ROOT%\Model.cs /namespace:Model

@ECHO 完成
pause
