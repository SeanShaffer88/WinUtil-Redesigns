# WinUtil-Redesigns launcher: Accessible Large
# Fetches the pre-built design script and runs it, passing through any
# arguments (for example -Preset Standard), exactly like the original
# WinUtil automation pattern.
& ([ScriptBlock]::Create((Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/accessible-large/winutil.ps1"))) @args
