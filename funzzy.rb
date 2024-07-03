class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/v1.3.0/funzzy-v1.3.0-x86_64-apple-darwin.tar.gz'
  version 'v1.3.0'
  sha256 '289441fa19c82bd4ce77f194052c4ec59334638b5e298fe7bbfbf6d49ebb23d0'


  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end
