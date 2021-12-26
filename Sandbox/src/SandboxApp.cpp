#include <Amigo.h>

class Sandbox : public Amigo::Application {

public:
    Sandbox() {}
    ~Sandbox() {}

};

Amigo::Application* Amigo::createApplication()
{
    return new Sandbox();
}