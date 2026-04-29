class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/0.3.0.tar.gz"
  sha256 "a05e7a3f3c51e10c73750d7cb481a8093c25116b9bc496bb83ec11af10e39ec3"
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
