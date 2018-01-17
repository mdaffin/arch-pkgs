#!/bin/bash
set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

repo=$PWD/repo

for package in pkg/*; do
    cd "$package"
    makepkg -srcfC
    cd -
done

s3fs mdaffin-arch:/repo "$repo" -o url=https://ams3.digitaloceanspaces.com,nosuid,nodev,default_acl=public-read
trap 'fusermount -u "$repo"' EXIT
rsync --ignore-existing -v pkg/*/*.pkg.tar.xz "$repo/x86_64/"
repose --verbose --xz --root="$repo/x86_64/" mdaffin
