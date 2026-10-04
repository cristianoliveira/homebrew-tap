class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.3.0'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.3.0/aerospace-gestures-v0.3.0-darwin-arm64.tar.gz'
    sha256 '32e8153c6fcbe45844a4554b01a15c8740252f30528733a516cb85d09230c2fc'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.3.0/aerospace-gestures-v0.3.0-darwin-amd64.tar.gz'
    sha256 '6da0edeca682bb7e8cf50de013186518073481a3ad2179abe589d10df5c649ec'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
