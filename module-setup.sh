#!/usr/bin/bash

depends() {
	return 0
}

install() {
	plymouth_file="${initdir}/usr/lib/systemd/system/systemd-ask-password-plymouth.path"
	console_file="${initdir}/usr/lib/systemd/system/systemd-ask-password-console.path"

	if [[ -f $plymouth_file ]]; then
		sed -i 's|DirectoryNotEmpty|#|g' $plymouth_file
		sed -i 's|MakeDirectory|#|g' $plymouth_file
		echo "PathExists=/run/show-pw-prompt" >> $plymouth_file
	fi

	if [[ -f $console_file ]]; then
		sed -i 's|DirectoryNotEmpty|#|g' $console_file
		sed -i 's|MakeDirectory|#|g' $console_file
		echo "PathExists=/run/show-pw-prompt" >> $console_file
	fi

	if [[ -f "${initdir}/usr/libexec/clevis-luks-askpass" ]]; then
		sed -i 's|todo=\$|>>/run/show-pw-prompt;todo=$|g' \
			${initdir}/usr/libexec/clevis-luks-askpass
	fi
}
