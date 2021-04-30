/* 7.8 Format conversion of integer types <inttypes.h> */

#ifndef _INTTYPES_H_
#define _INTTYPES_H_

typedef signed char  int8_t;
typedef signed short int16_t;
typedef signed int   int32_t;
typedef unsigned char  uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int   uint32_t;
#ifdef CONFIG_WIN32
typedef signed __int64   int64_t;
typedef unsigned __int64 uint64_t;
#else /* other OS */
typedef signed long long   int64_t;
typedef unsigned long long uint64_t;
#endif /* other OS */

#endif