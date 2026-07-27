class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.7.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "4af1414c96cf832b0f692842e6321dd8b3fd009b53da12f9c10785c3342fd4c4"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.7.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "004604855f97a278480593dba2d39b0aa8e9daaa5876a174edc7e7887fae2d9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.7.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "4cd96eb29dbe63c877981628dd33cf3d62691926ebdc4b98d2898309d3aecf25"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.7.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "3d1816ee0ea6b71d9ac773c7c5a1a1beb8c44346f889d9895d65e913f5612ce7"
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
    assert_match "eks-managed-node-groups version v#{version}", output
  end
end
