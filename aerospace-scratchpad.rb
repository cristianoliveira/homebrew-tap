class AerospaceScratchpad < Formula

  desc 'AeroSpace scratchpad - Scratchpad for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-scratchpad'
  version 'v0.1.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.0/aerospace-scratchpad-v0.1.0-darwin-arm64.tar.gz'
    sha256 '4995288b3d5653cfa33a4a11a9edcc67803bb5b0b9e2f6fa78fe91b88eef95d5'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.1.0/aerospace-scratchpad-v0.1.0-darwin-amd64.tar.gz'
    sha256 'ea2b50a94e7f03b03bae068d42affed214306aa3eb7e1ad118846682cb3da558'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system #{bin}/aerospace-scratchpad, --version
  end

end
