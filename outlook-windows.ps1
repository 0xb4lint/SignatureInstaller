$UserDataPath = $Env:appdata
$FolderLocation = $UserDataPath + '\Microsoft\Signatures\'

$url = Read-Host -Prompt 'enter url'
$osVersion = [System.Environment]::OSVersion.Version.Major

IF ($osVersion -ge 10) {
	[Net.ServicePointManager]::SecurityProtocol = "Tls12, Tls11, Tls, Ssl3"
} ELSE {
	[Net.ServicePointManager]::SecurityProtocol = "Tls, Ssl3"
}

$wc = New-Object System.Net.WebClient
$wc.Encoding = [System.Text.Encoding]::UTF8
$wc.CachePolicy = New-Object System.Net.Cache.HttpRequestCachePolicy([System.Net.Cache.HttpRequestCacheLevel]::NoCacheNoStore)
$signatureHTML = $wc.DownloadString($url)

mkdir $FolderLocation -force
$signatureFile = $FolderLocation + "signature.htm"

$signatureHTML | Out-File -Encoding Unicode $signatureFile


IF (Test-Path "HKCU:\Software\Microsoft\Office\14.0") {
	IF (!(Test-Path "HKCU:\Software\Microsoft\Office\14.0\Outlook\Options\Mail")) {
		New-Item "HKCU:\Software\Microsoft\Office\14.0\Outlook\Options\Mail" -Force
	}

	New-ItemProperty "HKCU:\Software\Microsoft\Office\14.0\Outlook\Options\Mail" -Name "BlockExtContent" -Value 0 -PropertyType DWORD -Force
	New-ItemProperty "HKCU:\Software\Microsoft\Office\14.0\Outlook\Options\Mail" -Name "Send Pictures With Document" -Value 0 -PropertyType DWORD -Force
}

IF (Test-Path "HKCU:\Software\Microsoft\Office\15.0") {
	IF (!(Test-Path "HKCU:\Software\Microsoft\Office\15.0\Outlook\Options\Mail")) {
		New-Item "HKCU:\Software\Microsoft\Office\15.0\Outlook\Options\Mail" -Force
	}

	New-ItemProperty "HKCU:\Software\Microsoft\Office\15.0\Outlook\Options\Mail" -Name "BlockExtContent" -Value 0 -PropertyType DWORD -Force
	New-ItemProperty "HKCU:\Software\Microsoft\Office\15.0\Outlook\Options\Mail" -Name "Send Pictures With Document" -Value 0 -PropertyType DWORD -Force
}

IF (Test-Path "HKCU:\Software\Microsoft\Office\16.0") {
	IF (!(Test-Path "HKCU:\Software\Microsoft\Office\16.0\Outlook\Options\Mail")) {
		New-Item "HKCU:\Software\Microsoft\Office\16.0\Outlook\Options\Mail" -Force
	}

	New-ItemProperty "HKCU:\Software\Microsoft\Office\16.0\Outlook\Options\Mail" -Name "BlockExtContent" -Value 0 -PropertyType DWORD -Force
	New-ItemProperty "HKCU:\Software\Microsoft\Office\16.0\Outlook\Options\Mail" -Name "Send Pictures With Document" -Value 0 -PropertyType DWORD -Force
}

""
"done."
