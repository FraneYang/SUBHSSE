#ifndef UTIL_CONVERT_HPP_
#define UTIL_CONVERT_HPP_

#include <string>
#include <algorithm>
#include <vector>

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

namespace util {

#ifndef NULL
#define NULL 0
#endif  // NULL

inline int isUtf8(const std::string &str) {
  // 找utf8的开头
  const char *begin = str.c_str();
  const char *end = begin + str.length();
  begin = std::find_if(begin, end, [](char c) -> bool { return c & 0x80; });
  if (end == begin) {
    // 全是ascii
    return 1;
  }
  if ((*begin & 0xe0) != 0xe0) {
    // 开头不是11 肯定不是
    return 0;
  }

  // 找utf8的结尾
  const char *utf8_end = begin + 1;
  // 最多四个字节长度的utf8
  if (end > begin + 4) {
    end = begin + 4;
  }
  utf8_end = std::find_if(utf8_end, end,
                          [&](char c) -> bool { return 0x80 != (c & 0xc0); });

  signed char cmp_ch = (signed char)0x80 >> (utf8_end - begin);
  return 2 * ((cmp_ch & *begin) == (cmp_ch << 1));
}

class utf8 {
 public:
  typedef std::string Type;
  enum { CodePage = CP_UTF8 };
};

class ascii {
 public:
  typedef std::string Type;
  enum { CodePage = CP_ACP };
};

class unicode {
 public:
  typedef std::wstring Type;
  // enum {
  //  CodePage = 0
  //};
};

template <typename T>
class trait {
 public:
  typedef typename T::Type RetType;
};

template <typename T>
inline typename trait<T>::RetType Convert(const std::wstring &wstr) {
  int len = WideCharToMultiByte(T::CodePage, NULL, wstr.c_str(), wstr.length(),
                                NULL, 0, NULL, NULL);
  std::vector<char> buf(len);
  len = WideCharToMultiByte(T::CodePage, NULL, wstr.c_str(), wstr.length(),
                            buf.data(), len, NULL, NULL);

  return std::string(buf.data(), len);
}

template <typename T>
inline typename trait<T>::RetType Convert(const std::string &str) {
  int type = isUtf8(str);
  if (type == 1 || (type == 2) == (T::CodePage == CP_UTF8)) {
    return str;
  }
  return Convert<T>(Convert<unicode>(str));
}

template <>
inline typename trait<unicode>::RetType Convert<unicode>(
    const std::string &str) {
  int code_page = CP_ACP;
  if (isUtf8(str) == 2) {
    code_page = CP_UTF8;
  }

  int len =
      MultiByteToWideChar(code_page, NULL, str.c_str(), str.length(), NULL, 0);
  std::vector<wchar_t> buf(len);
  len = MultiByteToWideChar(code_page, NULL, str.c_str(), str.length(),
                            buf.data(), len);
  return std::wstring(buf.data(), len);
}

}  // namespace util

#endif  // UTIL_CONVERT_HPP_