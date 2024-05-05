cmake_minimum_required(VERSION 3.29)
project(void-http)

find_package(Boost REQUIRED COMPONENTS system)
find_package(nlohmann_json 3.2.0 REQUIRED)

include_directories(${Boost_INCLUDE_DIRS})

set(CMAKE_CXX_STANDARD 20)

add_executable(void-http src/main.cc src/void_server.cc)

target_link_libraries(void-http PRIVATE ${Boost_LIBRARIES} nlohmann_json::nlohmann_json)

