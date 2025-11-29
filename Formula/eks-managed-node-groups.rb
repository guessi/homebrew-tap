class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.2.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "0d26fe7f697eb8786b8a39ec05eeb44089e9a56a1686a5c279f23c3211387863"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.2.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "45f843726366ff71383ce3ad97494f1b23aa9b9e799ba32fdd3c242de1d0ff52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.2.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "c6af466c390ff9fe0383211ec384030283e090a7a32f976bbc9bc9c67e2c1088"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.2.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "bd9dada57ecd1e29a27fb0a0fc3dc70fca2deeadeb907803d6a66069ec29148e"
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
