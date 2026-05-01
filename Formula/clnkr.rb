class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/0.3.4.tar.gz"
  sha256 "8fddf08fccbb873db0c246b8893fff755de0cd43dfb84f26a19a2adb531ddc01"
  license "MIT"

  depends_on "go" => :build

  def install
    system "make", "build", "VERSION=#{version}"
    bin.install "clnkr"
    bin.install "clnku"
    bin.install_symlink "clnkr" => "clnk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clnkr --version")
    assert_match version.to_s, shell_output("#{bin}/clnku --version")
  end
end
