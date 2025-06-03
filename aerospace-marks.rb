class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.2.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.2.1/aerospace-marks-v0.2.1-darwin-arm64.tar.gz'
    sha256 '5fba563a9b1c4625589c95ba962d34c7b4ab26972a4f4e3cc27acdcd5c2b493c'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.2.1/aerospace-marks-v0.2.1-darwin-amd64.tar.gz'
    sha256 'c64cc29127a375a05dbd46732ec1810c1440164d9c9883306578a0a7ace176a3'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
