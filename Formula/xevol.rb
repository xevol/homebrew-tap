require "language/node"

class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  url "https://registry.npmjs.org/xevol/-/xevol-0.12.4.tgz"
  sha256 "89428fa9081d108c3b12add3936020c913ab704fad322f8bb650e136a6ab3fab"
  license "UNLICENSED"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink libexec/"bin/xevol"
    bin.install_symlink libexec/"bin/xvl"
  end

  test do
    assert_match "0.12.4", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
