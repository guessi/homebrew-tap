class EksManagedNodeGroups < Formula
  desc "managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.1/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "b6f2a30d9820e009c5e0330bd072df3e907ac33eb8978cc10259a147d2e3e752"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.1/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "d5ef69b1d149f980781ed239bae7b0f1cce3245bf17ea674c5f64ddf5cf03569"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.1/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "f13cd2a4e0f6d83f3a06c064af134da12aa2c5302d4beacfb15534f430696ef2"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.1/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "2a72ec77494552386f067c45abb7332a81ac7e5c4494a6512ea3e35cdf4fb894"
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
