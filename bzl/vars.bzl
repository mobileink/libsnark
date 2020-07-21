# CMAKE_CXX_FLAGS = ["-std=c++11",
CXX_FLAGS = ["-std=c++11",
             "-Wall", "-Wextra", "-Wfatal-errors",
             "-Wno-unused-variables"
]

  # if("${MULTICORE}")
  #     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp")
  # endif()

OPT_FLAGS = ["-ggdb3", "-O2", "-march=native", "-mtune=native"]

# if multicore:  -fopenmp, -DMULTICORE

# if not with-procps: -DNO_PROCPS

# if ${IS_LIBFQFFT_PARENT} setup testing, tutorials
