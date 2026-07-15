class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.6.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.6.0/aerospace-scratchpad-v0.6.0-darwin-arm64.tar.gz'
    sha256 'e8fbe858fc2b2f2b55f62369cbc0c93ac72361ab4f76e43eb19f14edfb93699c'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.6.0/aerospace-scratchpad-v0.6.0-darwin-amd64.tar.gz'
    sha256 'ed428ed73f3294f06285cc57c9c5d3d7196ba0aacc926778110e3c2a06a4210b'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
