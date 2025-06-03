class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.1.2'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.2/aerospace-scratchpad-v0.1.2-darwin-arm64.tar.gz'
    sha256 '29cd47cdd7c6bb576d256c739dd3f4497b805210d1b2e59c3404faddd515683e'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.2/aerospace-scratchpad-v0.1.2-darwin-amd64.tar.gz'
    sha256 '944f18320a34acd6d9887f82bc461a652f7c6c2dfe436bc094ba785044f32885'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
