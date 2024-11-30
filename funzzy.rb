class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/v1.5.0/funzzy-v1.5.0-x86_64-apple-darwin.tar.gz'
  version 'v1.5.0'
  sha256 '3f782faf01da3083d629d464af81f784804d2253e0f07add28ed4a3160cd02e2'


  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end
