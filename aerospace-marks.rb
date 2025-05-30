class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.1.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.1.0/aerospace-marks-v0.1.0-darwin-arm64.tar.gz'
    sha256 'f8b08c396a9822adb828f23d610020dbc6a82de95158518e3dc73677b94ff08b'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.1.0/aerospace-marks-v0.1.0-darwin-amd64.tar.gz'
    sha256 '6e8bd5922e6ef4654cda10fdc1365f4f814366e4d0d17171fb2ab3238aa47304'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
