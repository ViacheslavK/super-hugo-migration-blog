#!/bin/bash
set -e

HUGO_VERSION=0.161.1

curl -sL "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" | tar -xz hugo

./hugo
