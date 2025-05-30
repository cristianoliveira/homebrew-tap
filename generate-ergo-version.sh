VERSION=`curl https://api.github.com/repos/cristianoliveira/ergo/releases/latest | jq .tag_name -r`

BINARY_FILE_NAME="ergo-$VERSION-darwin-amd64.tar.gz"
REPO_URL="https://github.com/cristianoliveira/ergo/releases/download/$VERSION/$BINARY_FILE_NAME"

wget $REPO_URL

SHASUM=`shasum -a 256 $BINARY_FILE_NAME | tee ergo.log | awk '{print $1}'`

echo "class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url '$REPO_URL'
  version '$VERSION'
  sha256 '$SHASUM'


  def install
    bin.install 'ergo'
  end

end" > ergo.rb

git add ergo.rb
git commit -m "chore: version $VERSION"

rm $BINARY_FILE_NAME
