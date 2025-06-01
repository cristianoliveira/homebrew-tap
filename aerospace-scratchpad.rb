class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.1.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.1/aerospace-scratchpad-v0.1.1-darwin-arm64.tar.gz'
    sha256 'f2cc51ef15e4ec274b61bd53522118fabefc1a238d2e0d7362f42509eb89a24d'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.1/aerospace-scratchpad-v0.1.1-darwin-amd64.tar.gz'
    sha256 '73db13d7b347cd79237779db308dc81968c7b35867503a4c940cdfd3937ba8aa'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
