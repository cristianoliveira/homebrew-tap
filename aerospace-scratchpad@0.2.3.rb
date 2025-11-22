class AerospaceScratchpadAT023 < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.2.3'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.3/aerospace-scratchpad-v0.2.3-darwin-arm64.tar.gz'
    sha256 '6a1eb9ff71d500f3d184a0476f30ee97e23c0d3457f349228dcd6d84fa356b0b'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.3/aerospace-scratchpad-v0.2.3-darwin-amd64.tar.gz'
    sha256 'e90d165e961f27a5a4584a6845d9803a27f3b711e707cd6606d9d94fec0771e7'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
