add_dependencies (${ErlangRocksDBNIF_TARGET} snappy)
include(GNUInstallDirs)

set(SNAPPY_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/../deps/snappy")
set(SNAPPY_ROOT_DIR "${CMAKE_CURRENT_BINARY_DIR}/snappy")
set(SNAPPY_INCLUDE_DIR "${SNAPPY_ROOT_DIR}/include")
set(SNAPPY_STATIC_LIB "${SNAPPY_ROOT_DIR}/${CMAKE_INSTALL_LIBDIR}/${CMAKE_STATIC_LIBRARY_PREFIX}snappy${CMAKE_STATIC_LIBRARY_SUFFIX}")
set(SNAPPY_LIBRARY ${SNAPPY_STATIC_LIB})

include(ExternalProject)

ExternalProject_Add(snappy
    SOURCE_DIR "${SNAPPY_SOURCE_DIR}"
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${SNAPPY_ROOT_DIR}
        -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    BINARY_DIR ${SNAPPY_ROOT_DIR}
    BUILD_BYPRODUCTS "${SNAPPY_STATIC_LIB}"
    )

set(SNAPPY_FOUND TRUE)

message(STATUS "Snappy library: ${SNAPPY_LIBRARY}")
message(STATUS "Snappy includes: ${SNAPPY_INCLUDE_DIR}")

mark_as_advanced(
    SNAPPY_ROOT_DIR
    SNAPPY_LIBRARY
    SNAPPY_INCLUDE_DIR
)

