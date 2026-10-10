class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "0.12.10"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.10/xevol-darwin-arm64.tar.gz"
      sha256 "5d7a4ba1dd54674633a788c9a9d77e01f9fc66e82f95ceaa711b0f202ae5fb9f"
    else
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.10/xevol-darwin-x64.tar.gz"
      sha256 "0f13cc59907481e7e2b0bad93101c548ddb9357e6b76d8f32fa2fbea34fd3887"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/xevol/homebrew-tap/releases/download/v0.12.10/xevol-linux-x64.tar.gz"
      sha256 "db70ac98854278acfa1ed1e0cdf88a2067e4c3f71b03c9d93c102fba2674c902"
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
    assert_match "0.12.10", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
