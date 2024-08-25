class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.4.1/ergo-v0.4.1-darwin-amd64.tar.gz'
  version 'v0.4.1'
  sha256 '13356de12d5038397c3deb2e4969c911f9eef125bf41dd520357605373fcda5a'


  def install
    bin.install 'ergo'
  end

end
