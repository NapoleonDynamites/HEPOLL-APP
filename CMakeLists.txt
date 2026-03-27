cmake_minimum_required(VERSION 3.16)
project(Hepoll)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Ищем Qt5, компонент Quick нужен
find_package(Qt5 REQUIRED COMPONENTS Quick Core Gui Qml)

# Создаём исполняемый файл
add_executable(hepoll-app
    main.cpp
    resources.qrc   # RCC будет обработан автоматически
)

# Линкуем с Qt5
target_link_libraries(hepoll-app PRIVATE Qt5::Quick Qt5::Core Qt5::Gui Qt5::Qml)

# Установка бинарника
install(TARGETS hepoll-app DESTINATION bin)
