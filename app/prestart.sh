#!/bin/bash
set -e

# TODO: check if content.tar.gz exists
# if [[ -z content.tar.gz ]]; then
#     echo content.tar.gz exists
# fi

mkdir -p content

if [ -z "$KEY" ]; then
    echo "content encryption key to provided. try running again with -e KEY=<passphrase>"
    exit 1
fi

openssl enc -d -aes256 -k $KEY -in content.tar.gz | tar xz -C content
rm content.tar.gz