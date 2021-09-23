cmake_minimum_required (VERSION 3.5)

project(repo2
    VERSION 1.0
)



message("CMAKE_PROJECT_NAME: ${CMAKE_PROJECT_NAME}")
message("CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")
message("CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}")

message("PROJECT_NAME: ${PROJECT_NAME}")
message("PROJECT_SOURCE_DIR: ${PROJECT_SOURCE_DIR}")
message("PROJECT_BINARY_DIR: ${PROJECT_BINARY_DIR}")

message("CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message("CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")

message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
message("CMAKE_MODULE_PATH: ${CMAKE_MODULE_PATH}")
message("CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")





#configurations





# dependencies

find_package(Repo1 REQUIRED)

if (NOT TARGET Repo1::library1)
  message("not find Repo1::library1")
endif ()

# include(Repo2FindDeps.cmake)


# targets and directories
add_subdirectory(library2)
add_subdirectory(binary2)




# export

# set(CMAKE_INSTALL_INCLUDEDIR include)
# set(CMAKE_INSTALL_LIBDIR lib)


# set(install_cmakedir ${CMAKE_INSTALL_LIBDIR}/cmake/repo2)

install(
    TARGETS
        library2
    EXPORT repo2-export
    LIBRARY DESTINATION lib/repo2
    ARCHIVE DESTINATION lib/repo2
)

install(
    EXPORT repo2-export
    FILE Repo2Targets.cmake
    NAMESPACE Repo2::
    DESTINATION lib/cmake/repo2
)


export(
    EXPORT repo2-export
    FILE ${CMAKE_CURRENT_BINARY_DIR}/Repo2Targets.cmake
    NAMESPACE Repo2::
)

export(PACKAGE Repo2)





include(CMakePackageConfigHelpers)



configure_package_config_file(
    ${CMAKE_CURRENT_LIST_DIR}/Repo2Config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/Repo2Config.cmake
    INSTALL_DESTINATION lib/cmake/repo2
)

# the config.cmake here is not suitable for installation
install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo2Config.cmake
  DESTINATION lib/cmake/repo2
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/Repo2ConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY ExactVersion
)

install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/Repo2ConfigVersion.cmake
  DESTINATION "lib/cmake/repo2"
)






install(
  FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/library2/public/library2.h
  DESTINATION "include/repo2/library2/public"
)














# #
# # Packaging.
# #

# set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
# set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
# set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# include(CPack)
