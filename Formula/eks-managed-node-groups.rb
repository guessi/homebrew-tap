class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.8/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "1bad746fdc3000b7416dd275ae9759b84e5bbd09e8c840eb279e2c9308bef85c"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.8/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "0236f117ceb4da212658e0a3a45f3c89864d360bb45bd80598eb238e74c6ed5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.8/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "7a4c56f264de66aeb62d4965d11c15211888c1d50bb3ca0ba4b3b77fe863a9c4"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.8/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "491d3b0b318225ce3aff66cc74b128626645718c5a3ae5c4e1.0.ce886de29a3303260ebc1f1feec63d9b8071b922267b8b2ef35642f2fc002ad4"
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
