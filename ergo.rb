class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.1.6/ergo-v0.1.6-darwin-amd64.tar.gz'
  version 'v0.1.6'
  sha256 '3ed39b1ecfaff5f022687dfa3c2255f40e21707683bb85b35c98ba8f32ddfb73'


  def install
    bin.install 'ergo'
  end

end
