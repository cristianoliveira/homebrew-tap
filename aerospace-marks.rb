class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.2.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.2.0/aerospace-marks-v0.2.0-darwin-arm64.tar.gz'
    sha256 '407e1140bea94e76b77c39cd71f56299878f2e1c517da72639be7071c852bb62'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.2.0/aerospace-marks-v0.2.0-darwin-amd64.tar.gz'
    sha256 'b8864a54545716d60fd2e3c044b75063df7ae70ade71a03e4b006ce19c207ea3'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
