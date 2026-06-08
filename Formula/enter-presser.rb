class EnterPresser < Formula
  include Language::Python::Virtualenv

  desc "Wait for a timer, then press Enter in the focused app"
  homepage "https://github.com/genericJE/enter-presser"
  url "https://github.com/genericJE/enter-presser/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "1f65739980acdbca10e8213aefe29c8ebe5c2aad592d4175fdfbac32bdf43b5f"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Press Enter/Return", shell_output("#{bin}/enter-presser --help")
    assert_match "Dry run", shell_output("#{bin}/enter-presser 0 --dry-run")
  end
end

