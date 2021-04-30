@echo off
REM ---------------
REM 发布包生成工具
REM 执行此文件前请先用Release生成publisher项目
REM --------------



REM --------------
REM 环境变量设置 Project_Src为如PUBLISHER4_CODING这样的分支
REM --------------
set PROJECT_SRC=%CD%

REM 源代码publisher项目文件夹
set PUBLISHER_SRC_ROOT=%PROJECT_SRC%\SUBHSSE\FineUIPro.Web

REM 源代码版本日志文件夹
set VerLog_SRC_ROOT=%PROJECT_SRC%\database\版本日志

REM 包文件夹名
SET ReleasePack=PackFile

REM 发布程序包文件夹
SET ReleasePackFolder=%PROJECT_SRC%\SUBHSSE%ReleasePack%

REM 发布包publisher文件所在文件夹
SET RELEASE_PUBLISHER_ROOT=%PROJECT_SRC%\SUBHSSE%ReleasePack%\%ReleasePack%

REM 发布包版本日志文件所在文件夹
SET RELEASE_VerLog_ROOT=%PROJECT_SRC%\SUBHSSE%ReleasePack%\版本日志


REM --------------
REM 发布程序包文件夹相关
REM --------------

IF exist %ReleasePackFolder%\nul.ext ( 
@echo 删除已存在的发布程序包文件夹
@echo. 
rd  %ReleasePackFolder% /S /Q
)
mkdir %ReleasePackFolder%


IF exist %RELEASE_VerLog_ROOT%\nul.ext (
rd  %RELEASE_VerLog_ROOT% /S /Q
)
mkdir %RELEASE_VerLog_ROOT%


IF errorlevel 1 goto delReleasePackError


@echo 设置.net控制台环境
@echo.
@call "%VS100COMNTOOLS%"vsvars32.bat
IF errorlevel 1 goto netEnvironmentError


@echo 开始预编译...
@echo.
aspnet_compiler -p %PUBLISHER_SRC_ROOT% %RELEASE_PUBLISHER_ROOT% -u -v /
IF errorlevel 1 goto aspnet_compilerError
@echo 预编译完成
@echo.


@echo 开始合并程序集...
@echo.
Aspnet_merge %RELEASE_PUBLISHER_ROOT% -o UI
IF errorlevel 1 goto Aspnet_mergeError
@echo 合并程序集完成
@echo.


REM --------------
REM 删除不必要的文件
REM --------------

@echo 开始清理垃圾文件...
@echo.

del %RELEASE_PUBLISHER_ROOT%\*.cs /s /f
del %RELEASE_PUBLISHER_ROOT%\*.designer.cs /s /f
del %RELEASE_PUBLISHER_ROOT%\*.csproj /s /f
del %RELEASE_PUBLISHER_ROOT%\*.csproj.* /s /f
del %RELEASE_PUBLISHER_ROOT%\*.pdb /s /f
del %RELEASE_PUBLISHER_ROOT%\*.resx /s /f

del %RELEASE_PUBLISHER_ROOT%\*.db /s /f
del %RELEASE_PUBLISHER_ROOT%\*.bak /s /f
del %RELEASE_PUBLISHER_ROOT%\*.*.bak /s /f
del %RELEASE_PUBLISHER_ROOT%\*.sln /s /f
del %RELEASE_PUBLISHER_ROOT%\*.suo /s /f
del %RELEASE_PUBLISHER_ROOT%\*.scc /s /f
rd %RELEASE_PUBLISHER_ROOT%\obj /s /q

del %RELEASE_PUBLISHER_ROOT%\ReadMe.txt /s /f
del %RELEASE_PUBLISHER_ROOT%\*.pfx /s /f
del %RELEASE_PUBLISHER_ROOT%\*.StyleCop /s /f

@echo 清理完成
@echo.

REM --------------
REM 拷贝版本日志
REM --------------
@echo 拷贝版本日志...
@echo.

copy %VerLog_SRC_ROOT%\*.* %RELEASE_VerLog_ROOT% /Y




@echo 发布包已生成,存放路径为%ReleasePackFolder%
@echo.
goto END


:delReleasePackError
@echo.
@echo 删除包存储文件夹失败!
goto END

:netEnvironmentError
@echo.
@echo .net环境设置失败!
goto END

:aspnet_compilerError
@echo.
@echo 预编译失败!
goto END

:Aspnet_mergeError
@echo.
@echo 合并程序集失败!
goto END

:END
pause
