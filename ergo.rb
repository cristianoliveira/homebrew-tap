class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.2.1/ergo-v0.2.1-darwin-amd64.tar.gz'
  version 'v0.2.1'
  sha256 '3da0afac56c102a9a57ae45598e338b4028685224b043f66b6b8a270270724f7'


  def install
    bin.install 'ergo'
  end

end
