class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/v1.1.0/funzzy-v1.1.0-x86_64-apple-darwin.tar.gz'
  version 'v1.1.0'
  sha256 '8501b749cf7069bfe88984eb16ac4f9eaf3a96ddbcc91c838c8b374feea15e08'


  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end
