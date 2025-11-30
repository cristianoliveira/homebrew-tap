class AerospaceMarks < Formula

  desc "AeroSpace marks - Vim like marks for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-marks"
  version 'v0.3.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.3.0/aerospace-marks-v0.3.0-darwin-arm64.tar.gz'
    sha256 '3c31d9431d6e5eae51032bf8622a55efed1c70bab16ebc2e9cf3c2b6f77bc4db'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.3.0/aerospace-marks-v0.3.0-darwin-amd64.tar.gz'
    sha256 '1c99652b81fc0bacc858f448e1e24a2f2acb88e3a0d257d8b53a67f4efbee3e9'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system "#\{bin\}/aerospace-marks", "--version"
  end

end
