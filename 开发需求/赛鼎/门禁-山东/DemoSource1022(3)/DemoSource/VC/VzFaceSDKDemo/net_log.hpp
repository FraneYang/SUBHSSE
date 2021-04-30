#ifndef NET_LOG_HPP_
#define NET_LOG_HPP_

#include <fstream>

inline std::ofstream &Log() {
  static std::ofstream ofs("test.log");
  return ofs;
}

#endif  // NET_LOG_HPP_