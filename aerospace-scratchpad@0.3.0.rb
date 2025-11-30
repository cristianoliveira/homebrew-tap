class AerospaceScratchpadAT030 < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.3.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.3.0/aerospace-scratchpad-v0.3.0-darwin-arm64.tar.gz'
    sha256 'ce78214f8ebb536b0384522070d21a1a5029557cde6368044c54624a94c89347'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.3.0/aerospace-scratchpad-v0.3.0-darwin-amd64.tar.gz'
    sha256 'c94ddc1ed596e718dea635d24c8802401b42108e4a0445b3f6cbf2f6bb65f348'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
