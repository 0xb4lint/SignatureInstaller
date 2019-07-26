# Signature Installer

## Apple Mail – [apple-mail.sh](apple-mail.sh)
1. Open **Mail**
2. Preferences / Signatures
3. Create a new one (or edit an existing) with dummy text
4. Quit from **Mail**
5. Open **Terminal**
6. Copy-Paste-Run this command:
	```
	curl https://raw.githubusercontent.com/0xB4LINT/SignatureInstaller/master/apple-mail.sh | bash
	```
7. Enter the URL of the HTML signature
8. Open **Mail** and use the new signature

## Microsoft Outlook (macOS) – [outlook-mac.sh](outlook-mac.sh)
1. Open **Terminal**
2. Copy-Paste-Run this command:
	```
	curl https://raw.githubusercontent.com/0xB4LINT/SignatureInstaller/master/outlook-mac.sh | bash
	```
3. Enter the URL of the HTML signature
4. Open **Outlook** and use the new signature
	1. Preferences / Signatures

## Microsoft Outlook (Windows) – [outlook-windows.ps1](outlook-windows.ps1)
1. **Command Prompt** *(cmd.exe)*
2. Copy-Paste-Run this command:
	```
	powershell.exe -Command "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/0xB4LINT/SignatureInstaller/master/outlook-windows.ps1')"
	```
3. Enter the URL of the HTML signature
4. Open **Outlook** and use the new signature
	1. File / Options
	2. Mail / Signatures
