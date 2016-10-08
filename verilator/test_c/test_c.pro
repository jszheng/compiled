TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

# main and verilated files
INCLUDEPATH += ./obj_dir
SOURCES += sim_main.cpp \
    ./obj_dir/Vtop__ALLcls.cpp \
    ./obj_dir/Vtop__ALLsup.cpp

win32 {
    # VS 2015 compiled
    compiled_lib_root = D:/work/code_gen/vs2015_libs
	
    QMAKE_CXXFLAGS = /vmg /Gm /Zi /FS
    QMAKE_CXXFLAGS_DEBUG   = /MTd /Od /RTC1
    QMAKE_CXXFLAGS_RELEASE = /MT /GS-

    CONFIG(debug, debug|release) {
        DEFINES += _DEBUG
        LIBS += -L$${compiled_lib_root}/lib/Debug
    } else {
        DEFINES += NDEBUG
        LIBS += -L$${compiled_lib_root}/lib/Release
    }
    #LIBS += SystemC.lib
} else {
	# cygwin or linux
	compiled_lib_root = /usr/local
}

# Verilator realted
DEFINES += VL_PRINTF=printf
DEFINES += VM_COVERAGE=0
DEFINES += VM_SC=1
DEFINES += VM_TRACE=1
INCLUDEPATH += $${compiled_lib_root}/include \
               $${compiled_lib_root}/include/vltstd

SOURCES += $${compiled_lib_root}/include/verilated.cpp \
           $${compiled_lib_root}/include/verilated_vcd_c.cpp


# GCC Warning Switch
# Could Add Compiler options with
# QMAKE_CFLAGS
# QMAKE_CXXFLAGS
#-Wno-char-subscripts
#-Wno-parentheses-equality
#-Wno-sign-compare
#-Wno-uninitialized
#-Wno-unused-but-set-variable
#-Wno-unused-parameter
#-Wno-unused-variable
#-Wno-deprecated

# SystemC related
# DEFINES += SC_INCLUDE_FX
