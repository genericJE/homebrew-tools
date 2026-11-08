class EnterPresser < Formula
  include Language::Python::Virtualenv

  desc "Wait for a timer, then press Enter in the focused app"
  homepage "https://github.com/genericJE/enter-presser"
  url "https://github.com/genericJE/enter-presser/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "972d4327bf53a87b4941a8b21df51083a91bdc0b68dd90d841be4c8de008362f"
  license "MIT"

  depends_on "python@3.15"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Press Enter/Return", shell_output("#{bin}/enter-presser --help")
    assert_match "Dry run", shell_output("#{bin}/enter-presser 0 --dry-run")
  end
end

