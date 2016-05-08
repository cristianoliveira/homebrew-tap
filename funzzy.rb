# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Funzzy < Formula
  desc "The Yet Another Fancy Watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  url "https://github.com/cristianoliveira/funzzy/releases/download/v0.3.0/funzzy-v0.3.0-x86_64-apple-darwin.tar.gz"
  version "0.3.0"
  sha256 "b34ee2d8339a54f7edaf122394a5074ad9c77b554629560322f5fc70c29a6b39"

  def install
    bin.install "funzzy"
  end

end
