class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/0.0.3.tar.gz"
  sha256 "4914e38eabac97d1b2d68646d04f08eaaaaf7480e79fcd4e1a0c204a26b4775a"
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
