class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.4.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.3/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "c21abee07d835b39d90afba72fbbe1547c0a5ae2541b0459f99d53c1c2b47b42"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.3/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "ddb80f3b4f34e967b7c9619d295bb160adbf9f74558ab4ed207309ee37732e1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.3/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "dfee2b0a13c8919df35d3f06cfd51e8a4436a635cf8de185f19488d6917a91bb"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.3/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "cb46cba747be7e5b3f6e59acd789995106cd30eb0ceb8d49910186e9c6d2eae4"
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
