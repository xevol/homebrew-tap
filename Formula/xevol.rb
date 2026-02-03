class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  url "https://github.com/xevol/xevol-cli/releases/download/v0.11.16/xevol-0.11.16-linux-x64.tar.gz"
  sha256 "e44d2788bc7b6be6e89fb0840f051d99016e152dbbfe2b435318301d7ccc7e10"
  license "UNLICENSED"
  version "0.11.16"

  # Only Linux x64 is currently supported for standalone binaries
  # For macOS, use: npm install -g xevol
  depends_on :linux
  depends_on arch: :x86_64

  def install
    bin.install "xevol-linux-x64" => "xevol"
    # Create xvl symlink (alias)
    bin.install_symlink "xevol" => "xvl"
  end

  test do
    assert_match "0.11.16", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
