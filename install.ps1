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
    "windows-terminal",
    "Jetbrains-Mono",
    "idea-ultimate",
    "Ninja",
    "Discord"
)

foreach ($software in $softwareList) {
    scoop install $software
}

# Add setting for windows-terminal
$sourcePath = ".\terminal-config\settings.json"
$destinationPath = "$env:USERPROFILE\scoop\apps\windows-terminal\current\settings\settings.json"
Copy-Item -Path $sourcePath -Destination $destinationPath


New-Item -Path $PROFILE -ItemType File -Force
Add-Content -Path $PROFILE -Value ". $env:USERPROFILE\.config\powershell\user_profile.ps1"
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
Install-Module -Name PSReadline -Scope CurrentUser -Force


# Create User Profile 
$script = @(
    "Import-Module Terminal-Icons",
    "Import-Module PSReadline",
    "oh-my-posh init pwsh --config `"$env:USERPROFILE\scoop\apps\oh-my-posh\current\themes\M365Princess.omp.json`" | Invoke-Expression"
)

$destinationPath = "$env:USERPROFILE\.config\powershell\user_profile.ps1"
try {
    Remove-Item -Force C:\Users\ND_PHUC\.config\powershell\user_profile.ps1
} catch {}
New-Item -Path "$env:USERPROFILE\.config\powershell" -ItemType Directory -Force


foreach ($text in $script) {
    Add-Content -Path $destinationPath -Value "$text"
}


# !! Create shortcut for Android Studio
try {
    $source = "$env:USERPROFILE\scoop\apps\android-studio\current\bin\studio64.exe"
    $shortcutPath = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Android Studio.lnk"

    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $source
    $shortcut.Save()

    Write-Host "Shortcut created successfully for Android Studio."
}
catch {
    Write-Host "Error creating shortcut for Android Studio: $_"
}