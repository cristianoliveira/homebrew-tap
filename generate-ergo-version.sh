#!/bin/sh

VERSION=$(curl -sf https://api.github.com/repos/cristianoliveira/ergo/releases/latest | jq .tag_name -r | cut -c 2-)

BINARY_FILE_NAME="ergo-v$VERSION-darwin-amd64.tar.gz"
REPO_URL="https://github.com/cristianoliveira/ergo/releases/download/v$VERSION/$BINARY_FILE_NAME"

wget -q --show-progress "$REPO_URL" -O "$BINARY_FILE_NAME"

SHASUM=$(shasum -a 256 "$BINARY_FILE_NAME" | grep -o '\w*')

cat << EOF > ergo.rb
class Ergo < Formula
  desc "The management of multiple apps running over different ports made easy"
  homepage "https://github.com/cristianoliveira/ergo"
  url "$REPO_URL"
  version "$VERSION"
  sha256 "$SHASUM"

  def install
    bin.install "ergo"
  end
end
EOF

git add ergo.rb
git commit -m "chore: version $VERSION"
