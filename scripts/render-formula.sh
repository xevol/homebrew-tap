#!/usr/bin/env bash
set -euo pipefail

: "${VERSION:?VERSION is required}"
: "${SHA_LINUX:?SHA_LINUX is required}"
: "${SHA_DARWIN_X64:?SHA_DARWIN_X64 is required}"
: "${SHA_DARWIN_ARM64:?SHA_DARWIN_ARM64 is required}"

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+([.-][0-9A-Za-z.-]+)?$ ]]; then
  echo "VERSION must be a semantic version without a v prefix." >&2
  exit 1
fi
for hash in "$SHA_LINUX" "$SHA_DARWIN_X64" "$SHA_DARWIN_ARM64"; do
  if [[ ! "$hash" =~ ^[a-f0-9]{64}$ ]]; then
    echo "Every release hash must be a lowercase SHA-256 value." >&2
    exit 1
  fi
done

release_url="https://github.com/xevol/homebrew-tap/releases/download/v$VERSION"
cat <<EOF
class Xevol < Formula
  desc "Command-line client for Xevol systems, products, and workflows"
  homepage "https://xevol.com"
  version "$VERSION"
  license "UNLICENSED"

  on_macos do
    if Hardware::CPU.arm?
      url "$release_url/xevol-darwin-arm64.tar.gz"
      sha256 "$SHA_DARWIN_ARM64"
    else
      url "$release_url/xevol-darwin-x64.tar.gz"
      sha256 "$SHA_DARWIN_X64"
    end
  end

  on_linux do
    on_intel do
      url "$release_url/xevol-linux-x64.tar.gz"
      sha256 "$SHA_LINUX"
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
    assert_match "$VERSION", shell_output("#{bin}/xevol --version")
    assert_match "Xevol is a tool", shell_output("#{bin}/xevol --help")
  end
end
EOF
