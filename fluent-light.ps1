# WinUtil-Redesigns launcher - Fluent Light (fluent-light)
# Downloads this design's built WinUtil script to a file and runs it from
# there. Running from a file matters: when WinUtil relaunches itself as
# Administrator, it re-runs its own file - so it re-runs THIS design
# instead of falling back to the official build.
$WinUtilDesignPath = Join-Path $env:TEMP "winutil-fluent-light.ps1"
Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/fluent-light/winutil.ps1" -OutFile $WinUtilDesignPath
& $WinUtilDesignPath @args
