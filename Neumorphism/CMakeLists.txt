cmake_minimum_required(VERSION 3.24.0)

find_package(Qt${QT_VERSION_MAJOR} COMPONENTS ShaderTools)

qt_add_qml_module(neumorphism
    URI Neumorphism
    VERSION 1.0
    SOURCES
        neumorphism.qrc
    NO_GENERATE_QMLDIR
)

qt_add_shaders(neumorphism "neumorphism-shaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    PREFIX
        "/Neumorphism/"
    FILES
        "Shaders/round-out-shadow.frag"
)

if (TARGET ${PROJECT_NAME} AND NOT PROJECT_NAME STREQUAL "neumorphism" )
    # This is required on Windows and MSVC
    target_link_directories(${PROJECT_NAME} PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}
    )

    # Next line is required for Qml Preview on Linux to be able to load the module
    target_link_libraries(${PROJECT_NAME} PRIVATE
        neumorphism
    )
endif()
