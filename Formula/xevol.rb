class Xevol < Formula
  desc "Command-line tool to consume, remix, make, publish, and offer systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.11.17"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.17/xevol-darwin-arm64.tar.gz"
      sha256 "58373ca078a8337cf5bfbe40795ac3e9bd9fc1c8be1829c796e0b12ecde648b1"
    else
      url "https://github.com/xevol/xevol-cli/releases/download/v0.11.17/xevol-darwin-x64.tar.gz"
      sha256 "993b46701a185a382b15c0275e1791b6abb3e1a6d7ef6d0cd4bb8f275cf2fbef"
    end
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/xevol/xevol-cli/releases/download/v0.11.17/xevol-linux-x64.tar.gz"
    sha256 "f34685bc7918ae8109f84eab8729769953e710c69266e9867167368862bcf535"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "xevol-darwin-arm64" => "xevol"
      else
        bin.install "xevol-darwin-x64" => "xevol"
      end
    else
      bin.install "xevol-linux-x64" => "xevol"
    end
    # Create xvl symlink (alias)
    bin.install_symlink "xevol" => "xvl"
  end

  test do
    assert_match "0.11.17", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
