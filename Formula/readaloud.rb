class Readaloud < Formula
  desc "Read-along terminal reader with Kokoro TTS and word-level highlighting"
  homepage "https://github.com/genericJE/readaloud"
  url "https://github.com/genericJE/readaloud/releases/download/v1.0.2/readaloud-1.0.2-arm64.tar.xz"
  version "1.0.2"
  sha256 "af9569566445c67981c4ce2e02ace5c311e1bbb069c689564347cc1346780f70"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install Dir["*"]

    # Precompile here rather than in the tarball so the paths recorded inside
    # the .pyc files match where they actually live.  Takes about five seconds
    # and saves about ninety on the first run.
    quiet_system libexec/"bin/python3.12", "-m", "compileall", "-q", "-j", "0",
                 "--invalidation-mode", "unchecked-hash", libexec/"lib/python3.12"

    (bin/"readaloud").write <<~SHELL
      #!/bin/sh
      exec "#{opt_libexec}/bin/python3.12" -s -E "#{opt_libexec}/bin/readaloud" "$@"
    SHELL
  end

  def caveats
    <<~EOS
      The Kokoro model weights (about 300MB) download on first run to
        ~/.cache/huggingface
      Set HF_HOME to keep that cache elsewhere.  It is not removed by
      `brew uninstall`.
    EOS
  end

  test do
    assert_match "readaloud #{version}", shell_output("#{bin}/readaloud --version")

    # Needs no tty, no network and no model weights: the voice table is built in.
    assert_match "af_heart", shell_output("#{bin}/readaloud --list-voices")

    # The bundled espeak-ng silently refuses a data path of 160 bytes or more
    # and `--version` would not notice, so resolve it for real.
    (testpath/"espeak.py").write <<~PYTHON
      import espeakng_loader
      from phonemizer.backend.espeak.wrapper import EspeakWrapper
      EspeakWrapper.set_library(espeakng_loader.get_library_path())
      EspeakWrapper.set_data_path(espeakng_loader.get_data_path())
      print("espeak-ng", EspeakWrapper().version)
    PYTHON
    assert_match "espeak-ng (1, 52, 0)",
                 shell_output("#{libexec}/bin/python3.12 -s -E #{testpath}/espeak.py")

    # Everything is synthesised on the Metal GPU; make sure MLX finds one.
    assert_match "Device(gpu",
                 shell_output("#{libexec}/bin/python3.12 -s -E -c " \
                              "'import mlx.core as mx; print(mx.default_device())'")
  end
end
