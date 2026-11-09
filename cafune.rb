class Cafune < Formula
  desc "Map macOS trackpad gestures to commands"
  homepage "https://github.com/cristianoliveira/cafune"
  url "https://github.com/cristianoliveira/cafune/archive/45762fa1e10f99dcdc71b07f2637dba813742b6d.tar.gz"
  version "0.7.0-alpha.1.post.45762fa"
  sha256 "eaad2e8d42a37da7a0be684ad0f95bc0dd63a7b37cdc9a4d9001bb26f9850667"
  license "MIT"

  depends_on xcode: ["16.4", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "--configuration", "release", "--disable-automatic-resolution"
    bin.install ".build/release/cafune"
  end

  test do
    assert_match "cafune", shell_output("#{bin}/cafune --help")
  end
end
