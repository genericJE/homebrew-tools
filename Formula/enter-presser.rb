class EnterPresser < Formula
  include Language::Python::Virtualenv

  desc "Wait for a timer, then press Enter in the focused app"
  homepage "https://github.com/genericJE/enter-presser"
  url "https://github.com/genericJE/enter-presser/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Press Enter/Return", shell_output("#{bin}/enter-presser --help")
    assert_match "Dry run", shell_output("#{bin}/enter-presser -t 0 --dry-run")
  end
end

