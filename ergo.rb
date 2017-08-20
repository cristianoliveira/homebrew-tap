class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.0.4/ergo-v0.0.4-x86_64-apple-darwin.tar.gz'
  version 'v0.0.4'
  sha256 ''


  def install
    bin.install 'ergo'
  end

end
