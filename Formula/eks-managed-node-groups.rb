class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.5.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "3ec046ef0e4e098aeec640f2fe946b1d2736bb5f32d1ca7ce5510415d1555ceb"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.5.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "f3dd2452fc949395837556bcf82c55abe216418072254113c1e34525008afff3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.5.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "9dbba7604e1b4f69246ae30c3c39e8e83ea426711cbeae2aedc79357ad470fbf"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.5.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "437ec069109e5bedff458675fb53b8af5e2a1f0ebf4eef65e667ce022a8d5412"
    end
  end

  def install
    bin.install "eks-managed-node-groups"
  end

  def caveats
    <<~EOS
      eks-managed-node-groups --help
    EOS
  end

  test do
    system "#{bin}/eks-managed-node-groups", "--version"

    output = shell_output("#{bin}/eks-managed-node-groups --version")
    assert_match "eks-managed-node-groups version", output
  end
end
