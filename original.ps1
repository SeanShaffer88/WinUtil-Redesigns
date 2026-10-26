# WinUtil-Redesigns launcher: Original (unmodified upstream)
# Fetches the pre-built design script and runs it, passing through any
# arguments (for example -Preset Standard), exactly like the original
# WinUtil automation pattern.
& ([ScriptBlock]::Create((Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/original/winutil.ps1"))) @args
