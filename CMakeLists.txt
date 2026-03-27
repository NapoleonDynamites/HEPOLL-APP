cmake_minimum_required(VERSION 3.16)
project(Hepoll)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_add_executable(hepoll-app
    main.cpp
    resources.qrc
)

target_link_libraries(hepoll-app PRIVATE Qt6::Quick)

# 👇 ВАЖНО: добавляем установку
install(TARGETS hepoll-app DESTINATION bin)
