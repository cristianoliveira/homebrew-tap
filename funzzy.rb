class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/v0.5.0/funzzy-v0.5.0-x86_64-apple-darwin.tar.gz'
  version 'v0.5.0'
  sha256 '915f2b559d3147537a06ad9eb4cb93047775455067754c0c9c0608e2a601421e'


  def install
    bin.install 'funzzy'
  end

end
