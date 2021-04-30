// stdafx.h : 标准系统包含文件的包含文件，
// 或是经常使用但不常更改的
// 特定于项目的包含文件

#pragma once

#ifndef _SECURE_ATL
#define _SECURE_ATL 1
#endif

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN            // 从 Windows 头中排除极少使用的资料
#endif

#include "targetver.h"

#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS      // 某些 CString 构造函数将是显式的

// 关闭 MFC 对某些常见但经常可放心忽略的警告消息的隐藏
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC 核心组件和标准组件
#include <afxext.h>         // MFC 扩展


#include <afxdisp.h>        // MFC 自动化类



#ifndef _AFX_NO_OLE_SUPPORT
#include <afxdtctl.h>           // MFC 对 Internet Explorer 4 公共控件的支持
#endif
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>                     // MFC 对 Windows 公共控件的支持
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


