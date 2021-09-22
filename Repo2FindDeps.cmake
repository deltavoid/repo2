

message("Repo2FindDeps.cmake begin")

find_package(Repo1 REQUIRED)

if (NOT TARGET Repo1::library1)
  message("not find Repo1::library1")
endif ()


message("Repo2FindDeps.cmake end")
