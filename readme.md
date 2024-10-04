# Automation Scripts

## Installation

### 1. Install Scoop
Run the following commands in PowerShell to install Scoop:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### 2. Run install.ps1
Navigate to the directory where `install.ps1` is located and execute the script with administrator:

```powershell
.\install.ps1
```
### 3. Add Automation Folder to Environment Variables
Add the ..\Automation directory to the Path environment variable by running:
### 4. Complie main.cpp and 12
## Usage
### 1. `svg` Command
The `svg` command saves the clipboard content as an SVG file `(test.svg)` on your desktop.
To use it, simply run:
```
svg
```
This will save any text from the clipboard into an SVG file with the following structure:

```xml
[Your Clipboard Text]
```
### 2. `main` Command
The `main` command downloads music from YouTube using `yt-dlp`.
To use it, run:

```powershell
main "https://www.youtube.com/watch?v=example"
```
This will download the video or audio file from the given URL.