class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/v1.8.4.tar.gz"
  sha256 "52e607578bb857026c63e2089a1d75d30909810eb09ec4651aad96d575e4c0f9"
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
