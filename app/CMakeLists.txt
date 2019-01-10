cmake_minimum_required(VERSION 3.5)

project(app)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5Widgets CONFIG REQUIRED)

add_executable(app
    mainwindow.ui
    mainwindow.cpp
    main.cpp
)
target_link_libraries(app Qt5::Widgets)
