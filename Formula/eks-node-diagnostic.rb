class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.12.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.12.1/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "4da05fd6f50831e5c74513369a6899447b66b78d66cb0f3358eb70a88e6c4821"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.12.1/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "b7e2f5ec98262c3d16e2064b3f29e60d237f06adbdac303d8b27ed578dbfbee5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.12.1/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "8853eb9922a7f02dda4eb67c56f40afa061a316d195a82cde61c58622bd16d6b"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.12.1/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "913de2b14e5dc49cb8b79851014e8753cf1b1a792f38f38b0bd1bc7d36f641e0"
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
    assert_match "eks-node-diagnostic version v#{version}", output
  end
end
