class Coffeinate < Formula
  desc "Keep your Mac awake, with style"
  homepage "https://github.com/genericJE/coffeinate"
  url "https://github.com/genericJE/coffeinate/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "34addb203cf87450345d5da5149d7b40e761d9162dfcf8fb6bab042816d85102"
  license "MIT"

  depends_on :macos

  def install
    bin.install "coffeinate"
  end

  test do
    assert_match "keep your Mac awake", shell_output("#{bin}/coffeinate -h")
  end
end
