class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "8ba47f8b76148f51185cf44d60125d5f2d19e940a2c4f705a367024c32349bd4"
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
