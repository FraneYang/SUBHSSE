#ifndef CROSSDEF_H_
#define CROSSDEF_H_

#if defined(WIN32) || defined(WIN64)

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#undef WIN32_LEAN_AND_MEAN
#else
#include <Windows.h>
#endif  // WIN32_LEAN_AND_MEAN

#ifndef SDK_API
#define SDK_API __declspec(dllimport)
#endif  // SDK_API

#define SDK_CALL __stdcall


#else

#define SDK_API
#define SDK_CALL

#define HWND void*
#define MAX_PATH 256

#endif
#ifdef _WIN64
//x64
typedef  _int64 size_int;
#else
//x86
typedef  int size_int;
#endif //_WIN64
#endif  // CROSSDEF_H_