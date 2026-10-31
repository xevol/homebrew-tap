class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.16.0"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.16.0/xevol-darwin-arm64.tar.gz"
      sha256 "fdb33112daf25613e99ce33cce35e449a50f081f273f59b3509d8af7832c28e6"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.16.0/xevol-darwin-x64.tar.gz"
      sha256 "4405612c5602fc15790183707c164f80e789e55b4c26d14ba9fc76aeb0c8ec79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.16.0/xevol-linux-x64.tar.gz"
      sha256 "58b0005b48f668e50a3051978eed0229261a09f3029123bc3a8c8ae9d47988cf"
    end
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
    bin.install_symlink "xevol" => "xvl"
  end

  test do
    assert_match "0.16.0", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
