class Funzzy < Formula
  desc "The yet another fancy watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  url "https://github.com/cristianoliveira/funzzy/releases/download/v0.3.3/funzzy-v0.3.3-x86_64-apple-darwin.tar.gz"
  version "0.3.3"
  sha256 "32531a489ac50b4ec9321b4fbe6d246b61d18ee87f6b86638cfe5d2ed72ccb6d"

  def install
    bin.install "funzzy"
  end
end
