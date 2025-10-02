class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.2.2'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.2/aerospace-scratchpad-v0.2.2-darwin-arm64.tar.gz'
    sha256 '5767806fd4f015e34d21699d12346edaabea52a851d3fa26ea7621fd69ace620'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.2/aerospace-scratchpad-v0.2.2-darwin-amd64.tar.gz'
    sha256 '12cf2b86d100e077bfd5ff31ecfd2fab4c9f1efeae762f7f8c3c66dc941eaa9c'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
