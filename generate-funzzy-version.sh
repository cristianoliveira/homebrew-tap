CARGO_VERSION="$(curl https://raw.githubusercontent.com/cristianoliveira/funzzy/master/Cargo.toml | grep version | awk -F\" '{print $2}')"
VERSION="v${1:-$CARGO_VERSION}"


BINARY_FILE_NAME="funzzy-$VERSION-x86_64-apple-darwin.tar.gz"
REPO_URL="https://github.com/cristianoliveira/funzzy/releases/download/$VERSION/$BINARY_FILE_NAME"

wget $REPO_URL

# Generate shasum and collect first column
SHASUM=`shasum -a 256 $BINARY_FILE_NAME | tee funzzy.log | awk '{print $1}'`

echo "shasum: $SHASUM"

echo "class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/$VERSION/funzzy-$VERSION-x86_64-apple-darwin.tar.gz'
  version '$VERSION'
  sha256 '$SHASUM'


  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end" > funzzy.rb

git add funzzy.rb
git commit -m "chore(funzzy): version $VERSION"
