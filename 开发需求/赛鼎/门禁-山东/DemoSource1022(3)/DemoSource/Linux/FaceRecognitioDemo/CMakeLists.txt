cmake_minimum_required(VERSION 3.2)

project(FaceRecognitionSDK)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

INCLUDE_DIRECTORIES(
  ${CMAKE_SOURCE_DIR}/SDK/inc
  
)
LINK_DIRECTORIES(
  ${CMAKE_SOURCE_DIR}/SDK/lib
#  ${OpenCV_DIR} 
)

SET(SRC_LIST
  ${CMAKE_SOURCE_DIR}/SDK/inc/cross_def.h
  ${CMAKE_SOURCE_DIR}/SDK/inc/zbx_sdk_def.h
  ${CMAKE_SOURCE_DIR}/SDK/inc/zbx_sdk.h
  ${CMAKE_SOURCE_DIR}/SDK/inc/changedevicenetwork.h
  
)
SET (Demo_List
  ${CMAKE_SOURCE_DIR}/main.cc
)

add_executable(${PROJECT_NAME}_demo ${Demo_List})
target_link_libraries(${PROJECT_NAME}_demo
  libFaceRecognitionSDK_x86.so
) 
