class Pxp < Formula

  desc "Pixel perfect CLI to harness image comparison"
  homepage "https://github.com/cristianoliveira/pxp"
  version 'v0.1.0'

  if Hardware::CPU.arm?
    url "https://github.com/cristianoliveira/pxp/releases/download/v0.1.0/pxp_darwin_arm64.tar.gz"
    sha256 "52d6fd81f1e4fd314aa69b1c6d17261ff41218319b248f5c830a829bc92032a4"
  else
    url "https://github.com/cristianoliveira/pxp/releases/download/v0.1.0/pxp_darwin_amd64.tar.gz"
    sha256 "1baaa04adfef0f5053a21d0915ba75fc067add82dabe54c3c67ef27c77dd9b78"
  end

  def install
    bin.install "pxp"
  end

  test do
    system "#{bin}/pxp", "--help"
  end

end
