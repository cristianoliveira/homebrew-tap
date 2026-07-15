class AerospaceMarks < Formula

  desc "AeroSpace marks - Vim like marks for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-marks"
  version 'v1.0.3'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.3/aerospace-marks-v1.0.3-darwin-arm64.tar.gz'
    sha256 '8cee20bdb092177fe3aad6cd2b1d55c3839067fcc78af6f61504edfdb49555b1'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.3/aerospace-marks-v1.0.3-darwin-amd64.tar.gz'
    sha256 '722727656fd79bfe0cc5d60ffb137a3f89eecbcf29b260377e99225cb9c27a18'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system "#\{bin\}/aerospace-marks", "--version"
  end

end
