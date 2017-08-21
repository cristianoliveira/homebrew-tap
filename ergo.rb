class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.1.0/ergo-v0.1.0-darwin-amd64.tar.gz'
  version 'v0.1.0'
  sha256 'bca2fe69888558e26c3dbdc4b0241de4dc530fc6c43c3a634b4626e8dce74aed'


  def install
    bin.install 'ergo'
  end

end
