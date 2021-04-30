#include "stdafx.h"
#include <iostream>
#include <io.h>
#include <fstream>
using namespace std;
// 获取当前程序路径
static string GetAppPath()
{
	string sAppPath;

	TCHAR tszModule[MAX_PATH + 1] = { 0 };
	::GetModuleFileName(NULL, tszModule, MAX_PATH);

	sAppPath.assign(tszModule);
	int pos = sAppPath.find_last_of(_T('\\'));
	sAppPath = sAppPath.substr(0, pos);

	return sAppPath;
}

static int WriteFileB(const char *filepath, unsigned char *pData, unsigned int len)
{
	int num = 0;

	FILE *fp = NULL;
	fopen_s(&fp, filepath, "wb+");

	if (fp == NULL)
	{
		return false;
	}

	fseek(fp, 0, SEEK_END);
	num = fwrite(pData, sizeof(char), len, fp);
	fclose(fp);

	return num > 0;
}

static int WriteFileT(const char *filepath, char *pData, unsigned int len)
{
	int num = 0;

	FILE *fp = NULL;
	fopen_s(&fp, filepath, "w+");

	if (fp == NULL)
	{
		return false;
	}

	fseek(fp, 0, SEEK_END);
	num = fwrite(pData, sizeof(char), len, fp);
	fclose(fp);

	return num > 0;
}

static bool ReadTextFile(const char *filepath, char *buffer, int max_len)
{
	int num = 0;

	FILE *fp = NULL;
	fp = fopen(filepath, "r");

	if (fp == NULL)
	{
		return false;
	}

	num = fread(buffer, sizeof(char), max_len, fp);
	fclose(fp);

	return num > 0;
}
static int IsPathExist(const char *filename)
{
	return (_access(filename, NULL) == 0);
}

static void WritePic(const char *filename, const char* buff, const int nlenth){
	std::ofstream ofs(filename, std::ios::binary);
	ofs.write((char*)buff, nlenth);
	ofs.close();
}