# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\ThermostatDemo_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\ThermostatDemo_autogen.dir\\ParseCache.txt"
  "ThermostatDemo_autogen"
  )
endif()
