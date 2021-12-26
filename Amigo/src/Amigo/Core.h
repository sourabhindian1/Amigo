#pragma once

#ifdef AG_PLATFORM_WINDOWS
    #ifdef AG_BUILD_DLL
        #define AMIGO_API __declspec(dllexport)
    #else
        #define AMIGO_API __declspec(dllimport)
    #endif
#else
    #error AMIGO only supports Windows!!
#endif