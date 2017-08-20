class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.0.4/ergo-v0.0.4-darwin-amd64.tar.gz'
  version 'v0.0.4'
  sha256 '28542cb1b0476866ba01935e04430c67c6d42df74a2cc99ce276111c4601bd26'


  def install
    bin.install 'ergo'
  end

end
