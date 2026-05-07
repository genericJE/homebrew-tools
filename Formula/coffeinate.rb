class Coffeinate < Formula
  desc "Keep your Mac awake, with style"
  homepage "https://github.com/genericJE/coffeinate"
  url "https://github.com/genericJE/coffeinate/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "1d5660de30581da0b8060a815a4882544066ede267df9453db6b3eed7509872a"
  license "MIT"

  depends_on :macos

  def install
    bin.install "coffeinate"
  end

  test do
    assert_match "keep your Mac awake", shell_output("#{bin}/coffeinate -h")
  end
end
