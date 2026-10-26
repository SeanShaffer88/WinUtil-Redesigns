# WinUtil-Redesigns launcher: Compact Expert
# Fetches the pre-built design script and runs it, passing through any
# arguments (for example -Preset Standard), exactly like the original
# WinUtil automation pattern.
& ([ScriptBlock]::Create((Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/compact-expert/winutil.ps1"))) @args
