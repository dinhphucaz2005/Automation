#include <windows.h>
#include <iostream>

char *readFromClipboard()
{
    if (!OpenClipboard(nullptr))
    {
        std::cerr << "Cannot open the clipboard." << std::endl;
        return nullptr;
    }

    if (IsClipboardFormatAvailable(CF_TEXT))
    {
        HANDLE hClipboardData = GetClipboardData(CF_TEXT);
        if (hClipboardData != nullptr)
        {
            char *pszText = static_cast<char *>(GlobalLock(hClipboardData));
            if (pszText != nullptr)
            {
                GlobalUnlock(hClipboardData);
                return pszText;
            }
            else
            {
                std::cerr << "Failed to lock the global memory." << std::endl;
            }
        }
        else
        {
            std::cerr << "Failed to get clipboard data." << std::endl;
        }
    }
    else
    {
        std::cerr << "No text data available on the clipboard." << std::endl;
    }
    CloseClipboard();
    return nullptr;
}