class AerospaceMarks < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.1/aerospace-marks-v0.0.1-darwin-amd64.tar.gz'
  version 'v0.0.1'
  sha256 'c584f9ad7aaef76e31b0ee9ff38cdd4739217341d2dac3cf585117c2e7afca08'


  def install
    bin.install 'aerospace-marks'
  end

end
