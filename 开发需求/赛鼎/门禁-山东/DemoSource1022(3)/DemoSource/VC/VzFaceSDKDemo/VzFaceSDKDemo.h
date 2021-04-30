// VzFaceSDKDemo.h : PROJECT_NAME 应用程序的主头文件
//

#pragma once

#ifndef __AFXWIN_H__
	#error "在包含此文件之前包含“stdafx.h”以生成 PCH 文件"
#endif

#include "resource.h"		// 主符号
#include <map>

// CVzFaceSDKDemoApp:
// 有关此类的实现，请参阅 VzFaceSDKDemo.cpp
//

class CVzFaceSDKDemoApp : public CWinApp
{
public:
	CVzFaceSDKDemoApp();

// 重写
	public:
	virtual BOOL InitInstance();

// 实现

	DECLARE_MESSAGE_MAP()
public:
	std::map<VzLPRClientHandle, UserRightsCfgs*> m_mapUserRightCfgs;
	typedef  std::map<VzLPRClientHandle, int> map_cameraHandle_version;
	map_cameraHandle_version m_map_cam_ver_;
	//sike 为1   //selftest 2
	int m_nCustomMade = -1;
};

extern CVzFaceSDKDemoApp theApp;