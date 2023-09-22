# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\DesktopAppUiDemo_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\DesktopAppUiDemo_autogen.dir\\ParseCache.txt"
  "DesktopAppUiDemo_autogen"
  )
endif()
