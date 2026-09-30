class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.1.0'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.1.0/aerospace-gestures-v0.1.0-darwin-arm64.tar.gz'
    sha256 '7f4611c7e34e42dd2cf64f7faf49de8a80e5e0d3212d4310eaddd5300fefcaac'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.1.0/aerospace-gestures-v0.1.0-darwin-amd64.tar.gz'
    sha256 'fb6b5373df97c941bed7b8c3136d16d09c77aded06214d4c78cb31d164ed2bc3'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
