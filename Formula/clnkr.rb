class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "f88ed446bbbf8180d83a15379ffc6e56f028e4b4475f282276c2585fbeb71f14"
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
