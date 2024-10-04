#include "ClipBoard.h"

const char *getDesktopPath(const char *fileName)
{
    const char *userProfile = std::getenv("USERPROFILE");
    if (userProfile)
    {
        std::string desktopPath = std::string(userProfile) + "\\Desktop\\" + fileName + ".svg";
        return desktopPath.c_str();
    }
    return nullptr;
}

int main(int argc, char *argv[])
{
    const char *path = getDesktopPath(argc == 2 ? argv[1] : "test");
    if (path)
    {
        freopen(path, "w", stdout);
    }
    char *s = readFromClipboard();
    std::cout << s;
    return 0;
}