@echo off
REM ---------------
REM ���������ɹ���
REM ִ�д��ļ�ǰ������Release����WebOA��Ŀ
REM --------------



REM --------------
REM ������������ Project_SrcΪ��WebOA�����ķ�֧
REM --------------
set PROJECT_SRC=%CD%
cd..

REM Դ����Model��Ŀ�ļ���
set Model_ROOT=%PROJECT_SRC%\SUBHSSE\Model


REM --------------
REM ����������ļ������
REM --------------




@echo ����.net����̨����
@echo.
@call "%VS100COMNTOOLS%"vsvars32.bat

SqlMetal /views  /server:. /database:SUBHSSEDB /code:%Model_ROOT%\Model.cs /namespace:Model

@ECHO ���
pause
