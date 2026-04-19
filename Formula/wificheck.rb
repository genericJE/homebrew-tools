class Wificheck < Formula
  desc "Notify when an unstable Wi-Fi connection comes back online"
  homepage "https://github.com/genericJE/wificheck"
  url "https://github.com/genericJE/wificheck/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6575be9c972f26d758d3b4c22d0685ba55cf9724f338fb8c2a13e588d287bcdc"
  license "MIT"

  depends_on :macos

  def install
    bin.install "wificheck"
  end

  test do
    assert_match "notify you when an unstable Wi-Fi connection",
                 shell_output("#{bin}/wificheck -h")
  end
end
