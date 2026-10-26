# WinUtil-Redesigns launcher - Midnight (midnight)
# Downloads this design's built WinUtil script to a file and runs it from
# there. Running from a file matters: when WinUtil relaunches itself as
# Administrator, it re-runs its own file - so it re-runs THIS design
# instead of falling back to the official build.
$WinUtilDesignPath = Join-Path $env:TEMP "winutil-midnight.ps1"
Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/midnight/winutil.ps1" -OutFile $WinUtilDesignPath
& $WinUtilDesignPath @args
