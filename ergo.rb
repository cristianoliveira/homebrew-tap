class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.3.0/ergo-v0.3.0-darwin-amd64.tar.gz'
  version 'v0.3.0'
  sha256 '5c640d88b2bb3aa02b7d67b3277cdad2da51c212a8d2400ef575834d0116a1de'


  def install
    bin.install 'ergo'
  end
end
