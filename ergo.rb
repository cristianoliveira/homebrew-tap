class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.2.4/ergo-v0.2.4-darwin-amd64.tar.gz'
  version 'v0.2.4'
  sha256 'e0742d6f94de3da2c919110de5ed0ae19fe651fd2516ea4b0fb6aeece4dc3ff6'


  def install
    bin.install 'ergo'
  end

end
