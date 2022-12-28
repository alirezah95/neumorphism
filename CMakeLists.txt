cmake_minimum_required(VERSION 3.24.0)

project(Neumorphism VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(QML_IMPORT_PATH
    ${CMAKE_CURRENT_SOURCE_DIR}
    CACHE STRING "" FORCE
)

find_package(QT NAMES Qt6 Qt5 COMPONENTS Gui Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Gui Core Quick REQUIRED)

add_subdirectory(
    "Example"
)
