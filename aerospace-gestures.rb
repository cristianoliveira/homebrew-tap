class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.2.0'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.2.0/aerospace-gestures-v0.2.0-darwin-arm64.tar.gz'
    sha256 'e08c0065846e2f056fdb0c414d1b81b5e494ad9cba8cc8d72c4590d09580a3c7'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.2.0/aerospace-gestures-v0.2.0-darwin-amd64.tar.gz'
    sha256 'f7bdce1f626482a27ec6f7555d3e7deaa6663d6aee3c568bfed797aba3f05859'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
