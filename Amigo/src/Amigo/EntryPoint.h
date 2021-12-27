#pragma once

#ifdef AG_PLATFORM_WINDOWS

extern Amigo::Application* Amigo::createApplication();

int main(int argc, char** argv)
{
    Amigo::Log::Init();
    AG_CORE_WARN("Initialized Log!!");
    AG_INFO("Hello I am Client!!");

    auto app = Amigo::createApplication();
    app->Run();
    delete app;
    return 0;
}

#endif
