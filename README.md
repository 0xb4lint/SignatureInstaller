# Signature Installer

## Apple Mail – [apple-mail.sh](apple-mail.sh)
1. Open **Mail**
2. Preferences / Signatures
3. Create a new one (or edit an existing) with dummy text
4. Quit from **Mail**
5. Open **Terminal**
6. Copy-Paste-Run this command:
	```
	curl https://raw.githubusercontent.com/valentinxxx/SignatureInstaller/master/apple-mail.sh | bash
	```
7. Enter the URL of the HTML signature
8. Open **Mail** and use the new signature

## Microsoft Outlook (Windows) – [outlook-windows.ps1](outlook-windows.ps1)
1. **Command Prompt** *(cmd.exe)*
2. Copy-Paste-Run this command:
	```
	powershell.exe -Command "IEX (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/valentinxxx/SignatureInstaller/master/outlook-windows.ps1')"
	```
3. Enter the URL of the HTML signature
4. Open **Outlook** and use the new signature
	1. File / Options
	2. Mail / Signatures

## Microsoft Outlook (macOS)
Waiting for the public AppleScript:
```
Hello,

After speaking with someone on the Outlook team, they provided me with the following information:

Linking to images for signatures is supported in the current version, however you need to use an Applescript to add the signature link to Outlook. The script will need to launch Outlook and add the signature directly to the signature preferences.

If you would like an example version of this script that references the Microsoft logo, let me know and I can send you a direct message here on the forums with the script file.

-Jesse
```
https://answers.microsoft.com/en-us/msoffice/forum/msoffice_officeinsider-mso_mac-msoinsider_outlook/outlook-v1520-signature-now-has-image-embedded-not/75a51b8f-78cf-48cd-8199-33fefaec73d0
