class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.0.1'

  if Hardware::CPU.arm?
    url https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.1/
    sha256 
  else
    url https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.1/
    sha256 c584f9ad7aaef76e31b0ee9ff38cdd4739217341d2dac3cf585117c2e7afca08
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
