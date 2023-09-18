# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\WashingMachine-UI_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\WashingMachine-UI_autogen.dir\\ParseCache.txt"
  "WashingMachine-UI_autogen"
  )
endif()
