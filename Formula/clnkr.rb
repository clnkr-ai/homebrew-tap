class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/v1.4.2.tar.gz"
  sha256 "00dc74c16d6a941d10eed092b08af03258d646d13b6e3b3cbd4ea0e099b11b99"
  license "MIT"

  depends_on "go" => :build

  def install
    system "make", "build-all", "VERSION=#{version}"
    bin.install "clnkr"
    bin.install "clnku"
    bin.install_symlink "clnkr" => "clnk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/clnkr --version")
    assert_match version.to_s, shell_output("#{bin}/clnku --version")
  end
end
