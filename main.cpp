#include "ClipBoard.h"
#include <vector>

using namespace std;

// yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "~/Music/%(title)s.%(ext)s" https://www.youtube.com/watch?v=0mUWhjfMOYU

int main(int argc, char *argv[])
{
    vector<string> list = {
        "yt-dlp", "-x", "--audio-format", "mp3",
        "--embed-thumbnail", "--add-metadata", "-o",
        "~/Music/%(title)s.%(ext)s"};
    string command = "";
    for (auto &x : list)
        command += x + ' ';
    char * url = readFromClipboard();
    command += url;
    system(command.c_str());
    return 0;    
} 