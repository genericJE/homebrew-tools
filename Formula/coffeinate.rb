class Coffeinate < Formula
  desc "Keep your Mac awake, with style"
  homepage "https://github.com/genericJE/coffeinate"
  url "https://github.com/genericJE/coffeinate/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "500317e470654c00485f45df9bde34b21d116d152194d490228b423eb705e69a"
  license "MIT"

  depends_on :macos

  def install
    bin.install "coffeinate"
  end

  test do
    assert_match "keep your Mac awake", shell_output("#{bin}/coffeinate -h")
  end
end
