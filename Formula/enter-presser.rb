class EnterPresser < Formula
  include Language::Python::Virtualenv

  desc "Wait for a timer, then press Enter in the focused app"
  homepage "https://github.com/genericJE/enter-presser"
  url "https://github.com/genericJE/enter-presser/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "5a6ef9f0a98ef42957d00c20483d7d519e5d377bb8e3fedba086a49cddb693f3"
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

