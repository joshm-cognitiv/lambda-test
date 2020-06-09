cmake_minimum_required(VERSION 3.9)
set(CMAKE_CXX_STANDARD 11)
project(demo LANGUAGES CXX)

find_package(aws-lambda-runtime REQUIRED)

add_executable(validator main.cpp)
target_link_libraries(validator PRIVATE AWS::aws-lambda-runtime)
target_compile_features(validator PRIVATE "cxx_std_11")

aws_lambda_package_target(validator)
