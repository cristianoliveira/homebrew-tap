class AerospaceScratchpadAT040 < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.4.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.4.0/aerospace-scratchpad-v0.4.0-darwin-arm64.tar.gz'
    sha256 '0adc25695033e62124137a3f7a0c90df72003ce8caf7b601c56c6b91433b6782'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.4.0/aerospace-scratchpad-v0.4.0-darwin-amd64.tar.gz'
    sha256 '937a4b12487fce9a6663d6085f5b000bc9a3920bac750034a5ff354f176edb06'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#\{bin\}/aerospace-scratchpad", "--version"
  end

end
