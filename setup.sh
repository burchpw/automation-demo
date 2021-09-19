#!/bin/bash
set -euo

export GPG_TTY=$(tty)
echo $PRIVATE_KEY | base64 -d >> private.key
gpg --batch --import private.key
sops -d sam_cart/credentials/encpyted_credentials.yml > sam_cart/credentials/credentials.yml
exec "$@"