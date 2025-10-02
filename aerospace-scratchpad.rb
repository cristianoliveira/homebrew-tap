class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.2.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.1/aerospace-scratchpad-v0.2.1-darwin-arm64.tar.gz'
    sha256 '33e696c27370d80c1a279380f3a65f716f2e5b1b0396b775098038b5822d86d6'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.2.1/aerospace-scratchpad-v0.2.1-darwin-amd64.tar.gz'
    sha256 '4b423cb47a4feb56f2f08d4be0afabf4762ad00aaf8f526a1a0f760f8fdf0e2a'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
