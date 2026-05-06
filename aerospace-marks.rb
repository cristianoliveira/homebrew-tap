class AerospaceMarks < Formula

  desc "AeroSpace marks - Vim like marks for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-marks"
  version 'v1.0.2'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.2/aerospace-marks-v1.0.2-darwin-arm64.tar.gz'
    sha256 'e9c13404bc27edf46bd9cb376bd7ed6010f6aeda2b5735291572dc89cb7a3868'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.2/aerospace-marks-v1.0.2-darwin-amd64.tar.gz'
    sha256 '8de5e552c06db50c944b5a281f3d59b64471ef3ef819bcc2225d7d78f134b03c'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system "#\{bin\}/aerospace-marks", "--version"
  end

end
