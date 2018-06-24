# Signature Installer

## Apple Mail – [apple-mail.sh](apple-mail.sh)
1. Open Mail
2. Preferences / Signatures
3. Create a new one with dummy text
4. Quit from Mail
5. Open Terminal
6. Copy-Paste-Run this command:
	```
	curl https://raw.githubusercontent.com/valentinxxx/SignatureInstaller/master/apple-mail.sh | bash -s "SIGNATURE_HTML_URL"
	```
	*(replace `SIGNATURE_HTML_URL`)*
7. Open Mail
