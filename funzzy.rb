class Funzzy < Formula

  desc 'The yet another fancy watcher'
  homepage 'https://github.com/cristianoliveira/funzzy'
  url 'https://github.com/cristianoliveira/funzzy/releases/download/v1.4.1/funzzy-v1.4.1-x86_64-apple-darwin.tar.gz'
  version 'v1.4.1'
  sha256 '8a75b62c20839bcfaff206392d84aaa33b7eb200dc3a134eff72c4479cd44159'


  def install
    bin.install 'funzzy'
    bin.install 'fzz'
  end

end
