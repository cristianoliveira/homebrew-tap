class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.0.1'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.1/aerospace-marks-v0.0.1-darwin-arm64.tar.gz'
    sha256 'b919322a925dac6bfdc9f2990a29ef9fc60ed7080d8ede2efb23242bfe4d2237'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.1/aerospace-marks-v0.0.1-darwin-amd64.tar.gz'
    sha256 'c584f9ad7aaef76e31b0ee9ff38cdd4739217341d2dac3cf585117c2e7afca08'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
