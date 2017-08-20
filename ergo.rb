class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.0.5/ergo-v0.0.5-darwin-amd64.tar.gz'
  version 'v0.0.5'
  sha256 'ac61f67628cf4890616fc36f5e7bfee03cf486885403fc2d1ca1c2546bb8add6'


  def install
    bin.install 'ergo'
  end

end
