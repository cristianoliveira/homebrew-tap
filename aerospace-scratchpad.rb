class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.5.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.5.0/aerospace-scratchpad-v0.5.0-darwin-arm64.tar.gz'
    sha256 '00dc87284e98a615d9c063a04fbab4673c29ef58e3bb7bbfcf789272344ad503'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.5.0/aerospace-scratchpad-v0.5.0-darwin-amd64.tar.gz'
    sha256 'a6684a63fc250f2201906016439545a5e78f89060b4148cbd139d779e998fb94'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
