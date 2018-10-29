class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url "https://github.com/cristianoliveira/ergo/releases/download/"v0.2.2"/ergo-"v0.2.2"-darwin-amd64.tar.gz"
  version "v0.2.2"
  sha256 ""


  def install
    bin.install 'ergo'
  end

end
