class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.1.3'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.3/aerospace-scratchpad-v0.1.3-darwin-arm64.tar.gz'
    sha256 '17ac6b200d1bbbdd261d0c57ee0006f0d639774f90c53bc2f9ee969e67503868'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.3/aerospace-scratchpad-v0.1.3-darwin-amd64.tar.gz'
    sha256 '77316b52325da2487de5b19f0a8b1116b1c899a484dcd395919a55f73806de69'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
