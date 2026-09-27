class Jeq < Formula

  desc "Typed judgment CLI for scripts, agents, and systems"
  homepage "https://github.com/cristianoliveira/jeq"
  version 'v0.1.0'

  if Hardware::CPU.arm?
    url 'https://github.com/cristianoliveira/jeq/releases/download/v0.1.0/jeq_0.1.0_darwin_arm64.tar.gz'
    sha256 'ee3c84b48bade83afc3b9bae6268102f491a5ba6cb5fb4679e6f752e4afb9d88'
  else
    url 'https://github.com/cristianoliveira/jeq/releases/download/v0.1.0/jeq_0.1.0_darwin_amd64.tar.gz'
    sha256 'b1d69530473741b6bc412fb5e0cec2434b1de6213f3be2238ceb892bdc6cccb2'
  end

  def install
    bin.install 'jeq'
  end

  test do
    system "#{bin}/jeq", "--help"
  end

end
