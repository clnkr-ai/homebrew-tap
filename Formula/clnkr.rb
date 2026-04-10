class Clnkr < Formula
  desc "A minimal coding agent CLI"
  homepage "https://github.com/clnkr-ai/clnkr"
  url "https://github.com/clnkr-ai/clnkr/archive/refs/tags/v1.8.5.tar.gz"
  sha256 "f7938682cbf55b11cfe6d51ce8bb9ee9533a77e7a5162c9541c5965a25d34692"
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
