class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.3.2/ergo-v0.3.2-darwin-amd64.tar.gz'
  version 'v0.3.2'
  sha256 'bba737fed59939aa74e4318b824601efc657eb10e854249d4e3ae459ed7c7337'


  def install
    bin.install 'ergo'
  end

end
