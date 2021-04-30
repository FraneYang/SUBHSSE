// stdafx.h : ��׼ϵͳ�����ļ��İ����ļ���
// ���Ǿ���ʹ�õ��������ĵ�
// �ض�����Ŀ�İ����ļ�

#pragma once

#ifndef _SECURE_ATL
#define _SECURE_ATL 1
#endif

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN            // �� Windows ͷ���ų�����ʹ�õ�����
#endif

#include "targetver.h"

#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS      // ĳЩ CString ���캯��������ʽ��

// �ر� MFC ��ĳЩ�����������ɷ��ĺ��Եľ�����Ϣ������
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC ��������ͱ�׼���
#include <afxext.h>         // MFC ��չ


#include <afxdisp.h>        // MFC �Զ�����



#ifndef _AFX_NO_OLE_SUPPORT
#include <afxdtctl.h>           // MFC �� Internet Explorer 4 �����ؼ���֧��
#endif
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>                     // MFC �� Windows �����ؼ���֧��
#endif // _AFX_NO_AFXCMN_SUPPORT
#include <afxcontrolbars.h>

#include "public.hpp"
#include "Convert.hpp"
#include "zbx_sdk_def.h"
#include "zbx_sdk.h"
#include "net_log.hpp"
typedef ZBX_Cam* VzLPRClientHandle;

#define WM_USER_MSG	(WM_USER+200)
#define WM_SHOW_COUNT_STAT_MSG	(WM_USER+201)
#define WM_SHOW_ALARM_MSG (WM_USER+202)
#define WM_CHANGE_CAMERA_STATUS_MSG (WM_USER+203)
#define WM_USER_MSG_ADDFACE	(WM_USER+204)
#define WM_USER_MSG_ALGORITHM	(WM_USER+205)
#define WM_USER_MSG_BASIC	(WM_USER+206)
#define WM_USER_MSG_BATCH	(WM_USER+208)
#define WM_USER_MSG_FACEMNG	(WM_USER+209)
#define WM_USER_MSG_JUR	(WM_USER+210)
#define WM_UPDATEUI_MSG	(WM_USER+211)
#define WM_USER_MSG_SENIOR	(WM_USER+212)
#define WM_USRAL_MSG	(WM_USER+213)
#define WM_USER_MSG_TF	(WM_USER+214)

#ifdef _UNICODE
#if defined _M_IX86
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='x86' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_IA64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='ia64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_X64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='amd64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#else
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='*' publicKeyToken='6595b64144ccf1df' language='*'\"")
#endif
#endif


