scoop install git
scoop bucket add extras
scoop bucket add nerd-fonts   

$softwareList = @(
    "7zip",
    "android-studio",
    "cmake",
    "ffmpeg",
    "fzf",
    "Meslo-NF-Mono",
    "mingw",
    "nano",
    "oh-my-posh",
    "ripgrep",
    "vscode",
    "yt-dlp",
    "postman",
    "coreutils",
    "Jetbrains-Mono",
    "idea-ultimate",
    "Ninja",
    "Discord"
)

foreach($software in $softwareList) {
    Write-Host "Installing: $software..." -ForegroundColor Cyan
    try {
        scoop install $software -ErrorAction Stop
        Write-Host "✔ Installed: $software" -ForegroundColor Green
    } catch {
        Write-Host "✘ An error ocured when install $software" -ForegroundColor Green
    }
}


# !! Create shortcut for Android Studio
try {
    $source = "$env:USERPROFILE\scoop\apps\android-studio\current\bin\studio64.exe"
    $shortcutPath = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Android Studio.lnk"

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $source
    $shortcut.Save()

    Write-Host "Shortcut created successfully for Android Studio." -ForegroundColor Green
} catch {
    Write-Host "Error creating shortcut for Android Studio: $_" -ForegroundColor Red
}


# Add setting for windows-terminal
$sourcePath = ".\terminal-config\settings.json"
$destinationPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
Copy-Item -Force -Path $sourcePath -Destination $destinationPath


New-Item -Path $PROFILE -ItemType File -Force
Add-Content -Path $PROFILE -Value ". $env:USERPROFILE\.config\powershell\user_profile.ps1"
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
Install-Module -Name PSReadline -Scope CurrentUser -Force
Install-Module -Name posh-git -Scope CurrentUser -Force


# Create User Profile 
$destinationPath = "$env:USERPROFILE\.config\powershell\user_profile.ps1"
Copy-Item -Force .\terminal-config\user_profile.ps1 $destinationPath