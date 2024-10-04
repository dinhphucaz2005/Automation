@echo off
del /q /f %temp%\*
rmdir /s /q %temp%

del /q /f C:\Windows\Prefetch\*
rmdir /s /q C:\Windows\Prefetch
