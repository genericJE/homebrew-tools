class Coffeinate < Formula
  desc "Keep your Mac awake, with style"
  homepage "https://github.com/genericJE/coffeinate"
  url "https://github.com/genericJE/coffeinate/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "e86478115688c9743c39579126813c426f777ac13b42d6d2cdb67e66cb2d46ca"
  license "MIT"

  depends_on :macos

  def install
    bin.install "coffeinate"
  end

  test do
    assert_match "keep your Mac awake", shell_output("#{bin}/coffeinate -h")
  end
end
