// VzFaceSDKDemo.h : PROJECT_NAME Ӧ�ó������ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������
#include <map>

// CVzFaceSDKDemoApp:
// �йش����ʵ�֣������ VzFaceSDKDemo.cpp
//

class CVzFaceSDKDemoApp : public CWinApp
{
public:
	CVzFaceSDKDemoApp();

// ��д
	public:
	virtual BOOL InitInstance();

// ʵ��

	DECLARE_MESSAGE_MAP()
public:
	std::map<VzLPRClientHandle, UserRightsCfgs*> m_mapUserRightCfgs;
	typedef  std::map<VzLPRClientHandle, int> map_cameraHandle_version;
	map_cameraHandle_version m_map_cam_ver_;
	//sike Ϊ1   //selftest 2
	int m_nCustomMade = -1;
};

extern CVzFaceSDKDemoApp theApp;