class AerospaceMarks < Formula

  desc "AeroSpace marks - Vim like marks for AeroSpace WM"
  homepage "https://github.com/cristianoliveira/aerospace-marks"
  version 'v1.0.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.0/aerospace-marks-v1.0.0-darwin-arm64.tar.gz'
    sha256 '57a9b9e9db978c38b915de706829d8fdc51f32bea9f5bf08c4abd7d99243d726'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v1.0.0/aerospace-marks-v1.0.0-darwin-amd64.tar.gz'
    sha256 '4329afcba1bb12ee696814be6751043ebfc448755c20aecda9b1f8f5589ed09f'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system "#\{bin\}/aerospace-marks", "--version"
  end

end
