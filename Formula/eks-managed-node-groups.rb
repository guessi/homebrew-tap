class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.1.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "3881c4b2c020a63489fe3c87b618452072cba03f36fc521fa293a120194a080b"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.1.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "2b088c115f5833d7ddbff2104521ce38e21ac2caf7c788b752352eadcb03d41f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.1.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "1df352cd9f1a06f108cb7c78bd3971c909e9aa8f90359808f1cefafd25cf8b02"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.1.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "11c9dac04cc65a6786c40eca0dd8a8cd7384a572b22f8da9b5f42483019779ec"
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
