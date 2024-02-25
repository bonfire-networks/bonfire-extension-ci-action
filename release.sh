#!/usr/bin/env bash

[ "$#" -ne 1 ] && echo "Usage: $(basename "$0") NEW_VERSION" && exit 1

version="$1"

git add --all
git commit -m "Release ${version}."
git tag "${version}"
git tag -d latest
git tag latest
git push
git push -f --tags
