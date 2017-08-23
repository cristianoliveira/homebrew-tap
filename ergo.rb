class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.1.3/ergo-v0.1.3-darwin-amd64.tar.gz'
  version 'v0.1.3'
  sha256 '4a4b7741774b2cd68b6cec20ab2f43e1859dc751192a18b481d89086a8e58f56'


  def install
    bin.install 'ergo'
  end

end
