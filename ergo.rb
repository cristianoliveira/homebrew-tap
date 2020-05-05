class Ergo < Formula
  desc "The management of multiple apps running over different ports made easy"
  homepage "https://github.com/cristianoliveira/ergo"
  url "https://github.com/cristianoliveira/ergo/releases/download/v0.2.5/ergo-v0.2.5-darwin-amd64.tar.gz"
  version "0.2.5"
  sha256 "03b4675a8c0bdd44796e503c69a1626fe0dc1135233221cb392c76ac88f2138c"

  def install
    bin.install "ergo"
  end
end
