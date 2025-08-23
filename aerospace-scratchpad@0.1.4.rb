class AerospaceScratchpadAT014 < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.1.4'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.4/aerospace-scratchpad-v0.1.4-darwin-arm64.tar.gz'
    sha256 '3dd881fb052bca476a7382f8034de0ab40ec076124ef0a6f64135e24e91d141d'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.4/aerospace-scratchpad-v0.1.4-darwin-amd64.tar.gz'
    sha256 'eca72aa272bccc1d1efe42e2bb25f462370075c62fc5eba5668fafe3d6850d42'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
