class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.2.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.0/aerospace-scratchpad-v0.2.0-darwin-arm64.tar.gz'
    sha256 'f4091c4e6fc3f5868f5a2d59844486935c57ff35f965faff5306f97d95c882d2'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.0/aerospace-scratchpad-v0.2.0-darwin-amd64.tar.gz'
    sha256 '22f9ec560664cc91ea0159eb841d46a9634d8fa5910354fd878b2c0d9e6ebdf9'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
