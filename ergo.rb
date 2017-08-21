class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.1.1/ergo-v0.1.1-darwin-amd64.tar.gz'
  version 'v0.1.1'
  sha256 'b1512ac03a295cfce0ae4ff8eadb66e88f42a5103cf33e53379b90ab71c5bcd3'


  def install
    bin.install 'ergo'
  end

end
