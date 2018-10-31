class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.2.5/ergo-v0.2.5-darwin-amd64.tar.gz'
  version 'v0.2.5'
  sha256 '03b4675a8c0bdd44796e503c69a1626fe0dc1135233221cb392c76ac88f2138c'


  def install
    bin.install 'ergo'
  end

end
