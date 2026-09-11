class FigmaCli < Formula

  desc "Figma CLI made for coding agents"
  homepage "https://github.com/cristianoliveira/figma-cli"
  version 'v0.1.0'

  if Hardware::CPU.arm?
    url "https://github.com/cristianoliveira/figma-cli/releases/download/v0.1.0/figma_0.1.0_darwin_arm64.tar.gz"
    sha256 "d944b333b70d881040ee96bbcdc695457573df794cc23c2cf17e225fbdefd43d"
  else
    url "https://github.com/cristianoliveira/figma-cli/releases/download/v0.1.0/figma_0.1.0_darwin_amd64.tar.gz"
    sha256 "5166fd160a8248b3efd7d02eed8a5fae9876d00190ae2271a02348ca1e32ef71"
  end

  def install
    bin.install "figma"
  end

  test do
    system "#{bin}/figma", "--help"
  end

end
