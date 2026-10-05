class AerospaceScratchpad < Formula

  desc "AeroSpace scratchpad - Scratchpad for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-scratchpad"
  version 'v0.7.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.7.1/aerospace-scratchpad-v0.7.1-darwin-arm64.tar.gz'
    sha256 'e0966c330c41dedfa63c9b0bda91dc71fefc031f60c63c0e07865de4cea60384'
  else
    url 'https://github.com/cristianoliveira/aerospace-scratchpad/releases/download/v0.7.1/aerospace-scratchpad-v0.7.1-darwin-amd64.tar.gz'
    sha256 '059ed215751c8272b2dfad8f0d03b6184dc755d630448cc34d20b4815efaea32'
  end

  def install
    bin.install 'aerospace-scratchpad'
  end

  test do
    system "#{bin}/aerospace-scratchpad", "--version"
  end

end
