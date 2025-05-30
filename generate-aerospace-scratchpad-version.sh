#!/bin/bash

set -euo pipefail

VERSION=`curl https://api.github.com/repos/cristianoliveira/aerospace-scratchpad/releases/latest | jq .tag_name -r`

AMD_BINARY_FILE_NAME="aerospace-scratchpad-$VERSION-darwin-amd64.tar.gz"
AMD_REPO_URL="https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/$VERSION/$AMD_BINARY_FILE_NAME"
ARM_BINARY_FILE_NAME="aerospace-scratchpad-$VERSION-darwin-arm64.tar.gz"
ARM_REPO_URL="https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/$VERSION/$ARM_BINARY_FILE_NAME"

wget $AMD_REPO_URL
wget $ARM_REPO_URL

AMD_SHASUM=`shasum -a 256 $AMD_BINARY_FILE_NAME | tee aerospace-scratchpad.log | awk '{print $1}'`
ARM_SHASUM=`shasum -a 256 $ARM_BINARY_FILE_NAME | tee aerospace-scratchpad.log | awk '{print $1}'`

echo "class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version '$VERSION'

  if Hardware::CPU.arm?
    url '${ARM_REPO_URL}'
    sha256 '${ARM_SHASUM}'
  else
    url '${AMD_REPO_URL}'
    sha256 '${AMD_SHASUM}'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#{bin}/aerospace-scratchpad", "--version"
  end

end" > aerospace-scratchpad.rb

git add aerospace-scratchpad.rb
git commit -m "chore: aerospace-scratchpad version $VERSION"

rm $AMD_BINARY_FILE_NAME
rm $ARM_BINARY_FILE_NAME
