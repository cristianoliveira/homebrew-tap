class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.6.0'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.6.0/aerospace-gestures-v0.6.0-darwin-arm64.tar.gz'
    sha256 '6f84c1ca924efa585dba5d43671696bcffc0d5db3ded86701475a1d46e1ce340'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.6.0/aerospace-gestures-v0.6.0-darwin-amd64.tar.gz'
    sha256 'b474819bd5d50ab9a685b66a20be6c76f6fca4b8d7e7f7adcfd387f7ac5999a6'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
