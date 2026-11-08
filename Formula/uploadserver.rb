class Uploadserver < Formula
  include Language::Python::Shebang

  desc "Minimal upload-only HTTP server with drag-and-drop web UI"
  homepage "https://github.com/genericJE/uploadserver"
  url "https://github.com/genericJE/uploadserver/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "44ef1e5ee7003897710b7573388c7c889c39628fae2bb99cc6c315c4b2f7c5d1"
  license "MIT"

  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "uploadserver.py"
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
