class Wificheck < Formula
  desc "Notify when an unstable Wi-Fi connection comes back online"
  homepage "https://github.com/genericJE/wificheck"
  url "https://github.com/genericJE/wificheck/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cc88752336b6f26521a9f8adcbad6449e9994207b7bc2e38bbd54697049a9a42"
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
