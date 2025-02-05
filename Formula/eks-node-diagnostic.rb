class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.2/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "5356bfd89e8e62189cbdc4f63ec5fe8f5d4093d4bc81d81c990f4abdd37323fb"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.2/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "96708df47fc851e24629e7552996cc17a9b33b72caba30b29f3a2f59ae668031"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.2/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "005ec28a2cf25308d648cb65b7839d7e394d564b1ff3cc0d65ecc82cfa459965"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.2/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "3f1826e872c50946adf41271c0d563fca1842195b195f9dfa2f528c5b1403806"
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
