class AerospaceMarksAT002 < Formula

  desc 'AeroSpace marks - Vim like marks for AeroSpace WM'
  homepage 'https://github.com/cristianoliveira/aerospace-marks'
  version 'v0.0.2'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.2/aerospace-marks-v0.0.2-darwin-arm64.tar.gz'
    sha256 '09a507c2dd98cf059f3bcbbd5f65a3b8b18fb62a45b5d38f814fd32ab1ce5330'
  else
    url 'https://github.com/cristianoliveira/aerospace-marks/releases/download/v0.0.2/aerospace-marks-v0.0.2-darwin-amd64.tar.gz'
    sha256 'a176836c33729200ff3b0fbe81d9302e8735d8640b2df7a372ebb9cafc7f4e9e'
  end

  def install
    bin.install 'aerospace-marks'
  end

  test do
    system #{bin}/aerospace-marks, --version
  end

end
