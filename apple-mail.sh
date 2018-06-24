#!/bin/bash

load_signature_file() {
	echo "searching signature file..."

	local SIGNATURES_PATH_ICLOUD="$HOME/Library/Mobile Documents/com~apple~mail/Data/V4/Signatures/"
	local SIGNATURES_PATH_NON_ICLOUD="$HOME/Library/Mail/V4/MailData/Signatures/"

	if [ -d "$SIGNATURES_PATH_ICLOUD" ]; then
		echo "found iCloud signature directory"
		local SIGNATURE_PATH="$SIGNATURES_PATH_ICLOUD"
	elif [ -d "$SIGNATURES_PATH_NON_ICLOUD" ]; then
		echo "found non-iCloud signature directory"
		local SIGNATURE_PATH="$SIGNATURES_PATH_NON_ICLOUD"
	else
		echo "signature directory not found"
		exit 1
	fi

	SIGNATURE_FILE=`ls -1t "$SIGNATURE_PATH"*.mailsignature | head -n 1`

	if [[ $? -ne 0 ]] || [[ -z "$SIGNATURE_FILE" ]]; then
		echo "listing error, create a signature"
		exit 1
	fi
}

download_signature() {
	echo "downloading signature..."

	local SIGNATURE_URL="$1"
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

	i=0;
	SIGNATURE=""
	while read line; do
		if [[ -z "$line" ]]; then
			break
		fi

		if [[ "$i" -eq 0 ]]; then
			SIGNATURE="$line"
		else
			SIGNATURE="$SIGNATURE\n$line"
		fi

		i=$((i + 1))
	done < "$SIGNATURE_FILE"

	SIGNATURE="$SIGNATURE\n\n$SIGNATURE_HTML"

	echo -e "$SIGNATURE" > "$SIGNATURE_FILE"

	echo "done."
}


load_signature_file
download_signature "$1"
setup_signature
