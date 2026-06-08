class EnterPresser < Formula
  include Language::Python::Virtualenv

  desc "Wait for a timer, then press Enter in the focused app"
  homepage "https://github.com/genericJE/enter-presser"
  url "https://github.com/genericJE/enter-presser/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3ef8e224441767115f03b057ddb6845ff52e6e11947468cb5e3ec843d816a125"
  license "MIT"

  depends_on "python@3.13"

  resource "pynput" do
    url "https://files.pythonhosted.org/packages/source/p/pynput/pynput-1.8.1.tar.gz"
    sha256 "fc53c26f5e042d963b4e349266dc38305e1db1b6de9abc13f539808f82e00d78"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/source/s/six/six-1.17.0.tar.gz"
    sha256 "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc5171de367e834932a81"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Press Enter/Return", shell_output("#{bin}/enter-presser --help")
    assert_match "Dry run", shell_output("#{bin}/enter-presser -t 0 --dry-run")
  end
end
