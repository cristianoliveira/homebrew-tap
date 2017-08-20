VERSION=$1

BINARY_FILE_NAME="ergo-$VERSION-x86_64-apple-darwin.tar.gz"
REPO_URL="https://github.com/cristianoliveira/ergo/releases/download/$VERSION/$BINARY_FILE_NAME"

wget $REPO_URL

SHASUM=`shasum -a 256 $BINARY_FILE_NAME | grep -o '\w*' `

echo "class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/$VERSION/ergo-$VERSION-x86_64-apple-darwin.tar.gz'
  version '$VERSION'
  sha256 '$SHASUM'


  def install
    bin.install 'ergo'
  end

end" > ergo.rb

git add ergo.rb
git commit -v "chore: version $VERSION"
