cmake_minimum_required(VERSION 3.16)
project(MyApp)

set(CMAKE_AUTOMOC ON)          # <- Включаем MOC
set(CMAKE_AUTORCC ON)          # <- Если есть ресурсы .qrc
set(CMAKE_AUTOUIC ON)          # <- Для .ui файлов, можно оставить

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_add_executable(MyAppExe
    main.cpp
    resources.qrc        # <- добавили ресурс
)
target_link_libraries(MyAppExe PRIVATE Qt6::Quick)
