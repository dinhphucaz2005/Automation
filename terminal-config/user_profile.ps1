Import-Module Terminal-Icons
Import-Module PSReadline
Import-Module posh-git

oh-my-posh init pwsh --config "C:\Users\dinhp\scoop\apps\oh-my-posh\current\themes\M365Princess.omp.json" | Invoke-Expression

function download-music {
    yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -o "~/Music/%(title)s.%(ext)s" $args
}

function cdf {
	param ([string]$filePath)
	cd (Get-Item $filePath).DirectoryName
}