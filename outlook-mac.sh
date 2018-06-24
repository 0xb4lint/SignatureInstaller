#!/bin/bash

download_signature() {
	echo "downloading signature..."

	echo "enter url:"
	exec 3<>/dev/tty
	read -u 3 SIGNATURE_URL

	if [[ -z "$SIGNATURE_URL" ]]; then
		echo "missing url"
		exit 1
	fi

	SIGNATURE_HTML=`curl -s "$SIGNATURE_URL"`

	if [[ -z "$SIGNATURE_HTML" ]]; then
		echo "empty signature url response"
		exit 1
	fi

	echo "done."
}

setup_signature() {
	echo "setting up signature..."

	SIGNATURE_HTML_ESCAPED=`echo "$SIGNATURE_HTML" | sed -e 's/"/\\\"/g'`

	osascript <<END
tell application id "com.microsoft.Outlook"
	make new signature with properties {name:"signature", content:"$SIGNATURE_HTML_ESCAPED"}
end tell
END

	echo "done."
}


download_signature
setup_signature
