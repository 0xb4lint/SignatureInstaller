$UserDataPath = $Env:appdata
$FolderLocation = $UserDataPath + '\Microsoft\Signatures\'

$url = Read-Host -Prompt 'enter url'

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls, ssl3"
$wc = New-Object System.Net.WebClient
$wc.Encoding = [System.Text.Encoding]::UTF8
$signatureHTML = $wc.DownloadString($url)

mkdir $FolderLocation -force
$signatureFile = $FolderLocation + "signature.htm"

$signatureHTML | Out-File -Encoding Unicode $signatureFile

""
"done."
