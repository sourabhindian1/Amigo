#pragma once

#ifdef AG_PLATFORM_WINDOWS

extern Amigo::Application* Amigo::createApplication();

int main(int argc, char** argv)
{
    auto app = Amigo::createApplication();
    app->Run();
    delete app;
    return 0;
}

#endif
