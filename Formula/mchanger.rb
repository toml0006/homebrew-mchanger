class Mchanger < Formula
  desc "CLI tool to control SCSI media changer devices (jukeboxes/autoloaders)"
  homepage "https://github.com/toml0006/mchanger"
  url "https://github.com/toml0006/mchanger/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "5a23db937deab5b3f8c7f125a7e2deef968f13a7b057bf6722f10aeb8ceb5d4f"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    bin.install "mchanger"
    # Install header and library for development use
    include.install "mchanger.h"
    system "make", "lib"
    lib.install "libmchanger.a"
  end

  test do
    # Just verify the binary runs (actual hardware tests not possible)
    assert_match "Usage:", shell_output("#{bin}/mchanger 2>&1", 1)
  end
end
