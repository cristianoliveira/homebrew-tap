# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Funzzy < Formula
  desc "The Yet Another Fancy Watcher"
  homepage "https://github.com/cristianoliveira/funzzy"
  url "https://github.com/cristianoliveira/funzzy/releases/download/v0.3.2/funzzy-v0.3.2-x86_64-apple-darwin.tar.gz"
  version "0.3.2"
  sha256 "787fb9185eaa229d7291f618fc3a3a1068c6e924362dab50642b9ee90a9e7560"


  def install
    bin.install "funzzy"
  end

end
