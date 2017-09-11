class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.1.7/ergo-v0.1.7-darwin-amd64.tar.gz'
  version 'v0.1.7'
  sha256 '0f0d03e79ae8c6eeb6420c761ef53852fbbe10e20aa3c070b2aadc61603bd2e8'


  def install
    bin.install 'ergo'
  end

end
