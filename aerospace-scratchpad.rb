class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.5.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.5.1/aerospace-scratchpad-v0.5.1-darwin-arm64.tar.gz'
    sha256 '5018b6183008f19e3582850b43e5734c28456b1790fa40bba3907befa323b23f'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.5.1/aerospace-scratchpad-v0.5.1-darwin-amd64.tar.gz'
    sha256 '3b45e6f012cb9467052f9ca779301e0a3df01a777aae6385f1e76e6a33066e43'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
