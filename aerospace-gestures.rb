class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.5.1'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.5.1/aerospace-gestures-v0.5.1-darwin-arm64.tar.gz'
    sha256 '0d30eb56e0b2033cca6ecfcaa1eab97930897c25cca76f3769cd38c572b8bfa3'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.5.1/aerospace-gestures-v0.5.1-darwin-amd64.tar.gz'
    sha256 'de0a6e4533e2823948533c925d08e133745d3ebe541414b5714892961119ce23'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
