class Uploadserver < Formula
  desc "Minimal upload-only HTTP server with drag-and-drop web UI"
  homepage "https://github.com/genericJE/uploadserver"
  url "https://github.com/genericJE/uploadserver/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "68152900a79e7c5bbf40b366c943000d3bd81ec4eaed6e402d7110a54d748cc9"
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
