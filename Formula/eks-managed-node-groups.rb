class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.3.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "bab742b34ee377464e58d52104aebb8c386c40205d875b58487d395c71a2a7de"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.3.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "05a63b2e8fbdac29599603b2d85dfe3805c118b50ccae2688fb487b5d65b4299"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.3.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "8343c4ac0f93b110de36a501c0dce8fb774f83521ce5613dc892f7f5f1e8bb2e"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.3.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "5279461c4e3bd12ea5ab593ca8f617bbe4a9b2d559909bb97a092b122dc2bd9c"
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
