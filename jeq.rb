class Jeq < Formula

  desc "Typed judgment CLI for scripts, agents, and systems"
  homepage "https://github.com/cristianoliveira/jeq"
  version 'v0.1.0-rc.1'

  if Hardware::CPU.arm?
    url "https://github.com/cristianoliveira/jeq/releases/download/v0.1.0-rc.1/jeq_0.1.0-rc.1_darwin_arm64.tar.gz"
    sha256 "f2e708ac467c91d0fa8fe52f099faf152a14dd0d2a18838337732481d5393c09"
  else
    url "https://github.com/cristianoliveira/jeq/releases/download/v0.1.0-rc.1/jeq_0.1.0-rc.1_darwin_amd64.tar.gz"
    sha256 "d5245f6839fd22913315ed761916466b63ca8a50d4c637bbbe924efde83033fe"
  end

  def install
    bin.install "jeq"
  end

  test do
    system "#{bin}/jeq", "--help"
  end

end
