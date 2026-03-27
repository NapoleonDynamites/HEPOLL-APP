cmake_minimum_required(VERSION 3.16)
project(Hepoll)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Используем переменные от Yocto/meta-qt5
# Qt5_PATH указывает на Qt5 в sysroot
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};${QT5_DIR}")

# Находим Qt5 компоненты
find_package(Qt5Core REQUIRED)
find_package(Qt5Gui REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5Quick REQUIRED)

# Исполняемый файл
add_executable(hepoll-app
    main.cpp
    resources.qrc
)

# Линкуем с Qt5
target_link_libraries(hepoll-app PRIVATE
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
)

install(TARGETS hepoll-app DESTINATION bin)
