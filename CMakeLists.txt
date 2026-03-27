cmake_minimum_required(VERSION 3.16)
project(Hepoll)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Ищем Qt5, компонент Quick нужен
find_package(Qt5 REQUIRED COMPONENTS Quick)

# Генерируем moc/uic/rcc (Qt5)
qt5_wrap_cpp(MOC_FILES main.cpp)
qt5_add_resources(RCC_FILES resources.qrc)

# Создаём исполняемый файл
add_executable(hepoll-app
    main.cpp
    ${MOC_FILES}
    ${RCC_FILES}
)

# Линкуем с Qt5::Quick
target_link_libraries(hepoll-app PRIVATE Qt5::Quick)

# Установка бинарника
install(TARGETS hepoll-app DESTINATION bin)
