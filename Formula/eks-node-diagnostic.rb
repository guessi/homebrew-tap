class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "8e2c4cd275c0903f12ea18761b453109b45bc47f8c91cea7e6ac05604307934f"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "e00035dd78153e688f3645c65cc48c6601f15a9c9a5133c4bcd42714f08f2c3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "ae81166e64c947863cbfe0ac7d0c705a34bc2f8ff9b82977fcda4e76b8b73b03"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "078bd1d6c3be3e453562e13d1ca881cfb0416e53dcda66614e69e726579c48d5"
    end
  end

  def install
    bin.install "eks-node-diagnostic"
  end

  def caveats
    <<~EOS
      eks-node-diagnostic --help
    EOS
  end

  test do
    system "#{bin}/eks-node-diagnostic", "--version"

    output = shell_output("#{bin}/eks-node-diagnostic --version")
    assert_match "eks-node-diagnostic version", output
  end
end
