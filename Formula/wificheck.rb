class Wificheck < Formula
  desc "Notify when an unstable Wi-Fi connection comes back online"
  homepage "https://github.com/genericJE/wificheck"
  url "https://github.com/genericJE/wificheck/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "060d58f9d30ef628275fb22d572af24c30fbe58cbbe5e097de6567bee967c9e7"
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
