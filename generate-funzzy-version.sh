#!/bin/sh

VERSION=$(curl -sf https://api.github.com/repos/cristianoliveira/funzzy/releases/latest | jq .tag_name -r | cut -c 2-)

BINARY_FILE_NAME="funzzy-v$VERSION-x86_64-apple-darwin.tar.gz"
REPO_URL="https://github.com/cristianoliveira/funzzy/releases/download/v$VERSION/$BINARY_FILE_NAME"

wget -q --show-progress "$REPO_URL" -O "$BINARY_FILE_NAME"

SHASUM=$(shasum -a 256 "$BINARY_FILE_NAME" | grep -o '\w*')

cat << EOF > funzzy.rb
class Funzzy < Formula
  desc "The yet another fancy watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  url "$REPO_URL"
  version "$VERSION"
  sha256 "$SHASUM"

  def install
    bin.install "funzzy"
  end
end
EOF

git add funzzy.rb
git commit -m "chore: version $VERSION"
