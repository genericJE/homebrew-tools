class Coffeinate < Formula
  desc "Keep your Mac awake, with style"
  homepage "https://github.com/genericJE/coffeinate"
  url "https://github.com/genericJE/coffeinate/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "591304c430284003ebc1fc8f75d2d1cc57c74e1f9dec9b96cbb1e3283a10a9b8"
  license "MIT"

  depends_on :macos

  def install
    bin.install "coffeinate"
  end

  test do
    assert_match "keep your Mac awake", shell_output("#{bin}/coffeinate -h")
  end
end
