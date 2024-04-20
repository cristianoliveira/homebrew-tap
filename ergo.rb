class Ergo < Formula

  desc 'Ergo Proxy - The local multiple services development made easy. No magic involved'
  homepage 'https://github.com/cristianoliveira/ergo'
  url 'https://github.com/cristianoliveira/ergo/releases/download/v0.4.0/ergo-v0.4.0-darwin-amd64.tar.gz'
  version 'v0.4.0'
  sha256 '0b34b2c2faafb37307f416ffa966d50394122661b57bb95bec526def948bc405'


  def install
    bin.install 'ergo'
  end

end
