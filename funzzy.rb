# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Funzzy < Formula
  desc "The Yet Another Fancy Watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  url "https://github.com/cristianoliveira/funzzy/releases/download/v0.3.2/funzzy-v0.3.2-x86_64-apple-darwin.tar.gz"
  version "0.3.2"
  sha256 "6cfce5267b639fc9d2ef4cbbe299e6c304e0984f1e73f6977debdad6f92af343"


  def install
    bin.install "funzzy"
  end

end
