VERSION=$1

BINARY_FILE_NAME="funzzy-$VERSION-x86_64-apple-darwin.tar.gz"
REPO_URL="https://github.com/cristianoliveira/funzzy/releases/download/$VERSION/$BINARY_FILE_NAME"

wget $REPO_URL

SHASUM=`shasum -a 256 $BINARY_FILE_NAME | grep -o '\w*' `

echo "class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/$VERSION/funzzy-$VERSION-x86_64-apple-darwin.tar.gz'
  version '$VERSION'
  sha256 '$SHASUM'


  def install
    bin.install 'funzzy'
  end

end" > funzzy.rb

git add funzzy.rb
git commit -v "chore: version $VERSION"
