#!/bin/bash
set -euo

export GPG_TTY=$(tty)
echo $PRIVATE_KEY | base64 -d >> private.key
gpg --batch --import private.key
sops -d ruby_code/credentials/encpyted_credentials.yml > ruby_code/credentials/credentials.yml
exec "$@"