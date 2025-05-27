class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.0.2'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.0.2/aerospace-scratchpad-v0.0.2-darwin-arm64.tar.gz'
    sha256 '168764692386b589ee26c78e35ebba7fa2ecb4a46a0592ef840ced0600c0f6f5'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.0.2/aerospace-scratchpad-v0.0.2-darwin-amd64.tar.gz'
    sha256 '838a8e0714c2bcea87ec7f4810b19ede13150aa81881124bd9c86918979cc10a'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
