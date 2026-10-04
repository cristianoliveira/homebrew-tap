class AerospaceGestures < Formula

  desc "Map macOS trackpad swipes to commands"
  homepage "https://github.com/cristianoliveira/aerospace-gestures"
  version 'v0.4.0'
  depends_on macos: :ventura

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.4.0/aerospace-gestures-v0.4.0-darwin-arm64.tar.gz'
    sha256 '5a068beafc4a21e159dc8a9cb0dfe54ed0c05e47f1ef611caf0dbdd7deb8f49e'
  else
    url 'https://github.com/cristianoliveira/aerospace-gestures/releases/download/v0.4.0/aerospace-gestures-v0.4.0-darwin-amd64.tar.gz'
    sha256 'cee1e5a479588711b90a95a4bc3f014ecaedb56aeb9e1dee9474cbe8639cf417'
  end

  def install
    bin.install 'aerospace-gestures'
  end

  test do
    system "#{bin}/aerospace-gestures", "--help"
  end

end
