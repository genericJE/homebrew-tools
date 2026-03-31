class Uploadserver < Formula
  desc "Minimal upload-only HTTP server with drag-and-drop web UI"
  homepage "https://github.com/genericJE/uploadserver"
  url "https://github.com/genericJE/uploadserver/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f6cb60d7b314e7504ab18788718a8563d7eb9269832f01e9714eccd773885389"
  license "MIT"

  depends_on "python@3"

  def install
    bin.install "uploadserver.py" => "uploadserver"
  end

  test do
    port = free_port
    pid = fork do
      exec bin/"uploadserver", port.to_s
    end
    sleep 2
    assert_match "Upload", shell_output("curl -s http://127.0.0.1:#{port}")
  ensure
    Process.kill("TERM", pid)
    Process.wait(pid)
  end
end
