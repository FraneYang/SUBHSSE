@echo off
REM ---------------
REM ���������ɹ���
REM ִ�д��ļ�ǰ������Release����publisher��Ŀ
REM --------------



REM --------------
REM ������������ Project_SrcΪ��PUBLISHER4_CODING�����ķ�֧
REM --------------
set PROJECT_SRC=%CD%

REM Դ����publisher��Ŀ�ļ���
set PUBLISHER_SRC_ROOT=%PROJECT_SRC%\SUBHSSE\FineUIPro.Web

REM Դ����汾��־�ļ���
set VerLog_SRC_ROOT=%PROJECT_SRC%\database\�汾��־

REM ���ļ�����
SET ReleasePack=PackFile

REM ����������ļ���
SET ReleasePackFolder=%PROJECT_SRC%\SUBHSSE%ReleasePack%

REM ������publisher�ļ������ļ���
SET RELEASE_PUBLISHER_ROOT=%PROJECT_SRC%\SUBHSSE%ReleasePack%\%ReleasePack%

REM �������汾��־�ļ������ļ���
SET RELEASE_VerLog_ROOT=%PROJECT_SRC%\SUBHSSE%ReleasePack%\�汾��־


REM --------------
REM ����������ļ������
REM --------------

IF exist %ReleasePackFolder%\nul.ext ( 
@echo ɾ���Ѵ��ڵķ���������ļ���
@echo. 
rd  %ReleasePackFolder% /S /Q
)
mkdir %ReleasePackFolder%


IF exist %RELEASE_VerLog_ROOT%\nul.ext (
rd  %RELEASE_VerLog_ROOT% /S /Q
)
mkdir %RELEASE_VerLog_ROOT%


IF errorlevel 1 goto delReleasePackError


@echo ����.net����̨����
@echo.
@call "%VS100COMNTOOLS%"vsvars32.bat
IF errorlevel 1 goto netEnvironmentError


@echo ��ʼԤ����...
@echo.
aspnet_compiler -p %PUBLISHER_SRC_ROOT% %RELEASE_PUBLISHER_ROOT% -u -v /
IF errorlevel 1 goto aspnet_compilerError
@echo Ԥ�������
@echo.


@echo ��ʼ�ϲ�����...
@echo.
Aspnet_merge %RELEASE_PUBLISHER_ROOT% -o UI
IF errorlevel 1 goto Aspnet_mergeError
@echo �ϲ��������
@echo.


REM --------------
REM ɾ������Ҫ���ļ�
REM --------------

@echo ��ʼ���������ļ�...
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

@echo �������
@echo.

REM --------------
REM �����汾��־
REM --------------
@echo �����汾��־...
@echo.

copy %VerLog_SRC_ROOT%\*.* %RELEASE_VerLog_ROOT% /Y




@echo ������������,���·��Ϊ%ReleasePackFolder%
@echo.
goto END


:delReleasePackError
@echo.
@echo ɾ�����洢�ļ���ʧ��!
goto END

:netEnvironmentError
@echo.
@echo .net��������ʧ��!
goto END

:aspnet_compilerError
@echo.
@echo Ԥ����ʧ��!
goto END

:Aspnet_mergeError
@echo.
@echo �ϲ�����ʧ��!
goto END

:END
pause
