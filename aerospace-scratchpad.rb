class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.0.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.0.1/aerospace-scratchpad-v0.0.1-darwin-arm64.tar.gz'
    sha256 '70e35946aa4a784201ce7b99ae85735b20fc35e04b7c79f6492ee2e6f9c82035'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.0.1/aerospace-scratchpad-v0.0.1-darwin-amd64.tar.gz'
    sha256 '6176e8f7879eac00ec173c24ec73f67f4f0f33ddfdc943edbf43829b6028661e'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
