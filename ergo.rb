class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.2.0/ergo-v0.2.0-darwin-amd64.tar.gz'
  version 'v0.2.0'
  sha256 '293e229ff3e0d99c1e542baa33c6a7d826520fc172893eb22c4d3a0e05c6092a'


  def install
    bin.install 'ergo'
  end

end
