PROJECT(TALib)

# 平台架构后缀
if( CMAKE_SIZEOF_VOID_P EQUAL 8 )
    set( PROCESSOR_EXT "x64" )
else()
    set( PROCESSOR_EXT "x86" )
endif()

if (CMAKE_HOST_WIN32)
    set(PLATFORM_EXT "Windows")
elseif(CMAKE_HOST_UNIX)
    set(PLATFORM_EXT "Unix")
elseif(CMAKE_HOST_APPLE)
    set(PLATFORM_EXT "MacOS")
endif()

# Include
include_directories(include)
include_directories(./src/ta_common)
include_directories(./src/ta_abstract)
include_directories(./src/ta_abstract/frames)

# Srcs
aux_source_directory(./src/ta_abstract SRCS_ABSTRACT)
aux_source_directory(./src/ta_abstract/frames SRCS_ABSTRACT_FRAMES)
aux_source_directory(./src/ta_abstract/tables SRCS_ABSTRACT_TABLES)
aux_source_directory(./src/ta_common SRCS_COMMON)
aux_source_directory(./src/ta_func SRCS_FUNC)

# Libs
LINK_LIBRARIES(m msvcrt)
add_library(TALib_Static STATIC ${SRCS_COMMON}  ${SRCS_FUNC} ${SRCS_ABSTRACT_FRAMES} ${SRCS_ABSTRACT_TABLES} ${SRCS_ABSTRACT})
add_library (TALib_Shared SHARED ${SRCS_COMMON} ${SRCS_FUNC}  ${SRCS_ABSTRACT_FRAMES} ${SRCS_ABSTRACT_TABLES} ${SRCS_ABSTRACT})
set_target_properties(TALib_Static PROPERTIES OUTPUT_NAME "libTALib.${PLATFORM_EXT}.${PROCESSOR_EXT}" PREFIX "") 
set_target_properties(TALib_Shared PROPERTIES OUTPUT_NAME "TALib.${PLATFORM_EXT}.${PROCESSOR_EXT}" PREFIX "") 

# SetPath
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/libs)
SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)

# tests
include_directories(./src/tools/ta_regtest)
include_directories(./src/ta_func)

aux_source_directory(./src/tools/ta_regtest/ta_test_func SRCS_TESTFUNCS)
aux_source_directory(./src/tools/ta_regtest SRCS_TEST)

set(SRCS_TEST2 
    "./src/tools/ta_regtest/test_util.c"
    "./src/tools/ta_regtest/test_data.c"    
    "./src/tools/ta_regtest/test_abstract.c"
    "./src/tools/ta_regtest/test_internals.c"
    "./src/tools/ta_regtest/ta_regtest.c")

add_executable(ta_regtest ${SRCS_TESTFUNCS} ${SRCS_TEST2} )
target_link_libraries(ta_regtest TALib_Static)
set_target_properties(ta_regtest PROPERTIES OUTPUT_NAME "ta_regtest.${PLATFORM_EXT}.${PROCESSOR_EXT}") 


# play
add_executable(play ./play/play.c)
target_link_libraries(play TALib_Static)


# Build Events
add_custom_command(TARGET TALib_Shared POST_BUILD 
    COMMAND echo "copy $<TARGET_FILE:TALib_Shared>..."
    COMMAND ${CMAKE_COMMAND} -E copy  $<TARGET_FILE:TALib_Shared> ${PROJECT_SOURCE_DIR}/../../bin/   
)
