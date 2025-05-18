#!/bin/bash

VERSION=`curl https://api.github.com/repos/cristianoliveira/aerospace-marks/releases/latest | jq .tag_name -r`

AMD_BINARY_FILE_NAME="aerospace-marks-$VERSION-darwin-amd64.tar.gz"
AMD_REPO_URL="https://github.com/cristianoliveira/aerospace-marks/releases/download/$VERSION/$AMD_BINARY_FILE_NAME"
ARM_BINARY_FILE_NAME="aerospace-marks-$VERSION-darwin-arm64.tar.gz"
ARM_REPO_URL="https://github.com/cristianoliveira/aerospace-marks/releases/download/$VERSION/$ARM_BINARY_FILE_NAME"

wget $AMD_REPO_URL
wget $ARM_REPO_URL

AMD_SHASUM=`shasum -a 256 $AMD_BINARY_FILE_NAME | tee aerospace-marks.log | awk '{print $1}'`
ARM_SHASUM=`shasum -a 256 $ARM_BINARY_FILE_NAME | tee aerospace-marks.log | awk '{print $1}'`

echo "class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version '$VERSION'

  if Hardware::CPU.arm?
    url '${ARM_REPO_URL}'
    sha256 '${ARM_SHASUM}'
  else
    url '${AMD_REPO_URL}'
    sha256 '${AMD_SHASUM}'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system "#{bin}/aerospace-marks", "--version"
  end

end" > aerospace-marks.rb

git add aerospace-marks.rb
git commit -m "chore: aerospace-marks version $VERSION"
