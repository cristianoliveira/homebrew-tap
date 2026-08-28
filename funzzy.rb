class Funzzy < Formula

  desc "The yet another fancy watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  version 'v2.0.0'

  url 'https://github.com/cristianoliveira/funzzy/releases/download/v2.0.0/funzzy-v2.0.0-x86_64-darwin.tar.gz'
  sha256 '7d7422e7469019111e2e3cf1b6e6d713895320019c9146cb09bcb59dfec1974c'

  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end
