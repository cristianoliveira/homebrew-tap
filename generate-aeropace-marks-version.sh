#!/bin/bash

VERSION=`curl https://api.github.com/repos/cristianoliveira/aerospace-marks/releases/latest | jq .tag_name -r`

BINARY_FILE_NAME="aerospace-marks-$VERSION-darwin-amd64.tar.gz"
REPO_URL="https://github.com/cristianoliveira/aerospace-marks/releases/download/$VERSION/$BINARY_FILE_NAME"

wget $REPO_URL

SHASUM=`shasum -a 256 $BINARY_FILE_NAME | tee aerospace-marks.log | awk '{print $1}'`

echo "class AeroSpaceMarks < Formula

  desc 'This is an cli for AeroSpace WM to manage marks on windows.'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  url '$REPO_URL'
  version '$VERSION'
  sha256 '$SHASUM'


  def install
    bin.install 'aerospace-marks'
  end

end" > aerospace-marks.rb

git add aerospace-marks.rb
git commit -m "chore: aerospace-marks version $VERSION"
