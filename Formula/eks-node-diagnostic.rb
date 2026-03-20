class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.9.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.2/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "7bc5be9475c2b1f5df0fb0dd41b4beb03de0e3d6af75860a4de5e1ba1a053dde"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.2/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "751c2af10f659d5101beb51375b5d36a6b5a2fbd7e32371438a06c9710c6bdfb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.2/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "33cb15a9fb59f0f7f73e45aea1ee4145ec927da8746e389b85ab59aa1b493f8f"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.2/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "7226640945ac28a1a84a68d1353a557155db38d2fde8108c48b0345e8a2bb7e6"
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
