class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.7/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "94179bd3c7d6b25ad141fa15d16511f81a5216821a6506286b01a6b5a6ca8063"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.7/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "e901908238c0c46c0d0e0f5805f75d876f54b465528a3c5247734aa4c3872709"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.7/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "0acc115870fc22d66bbd74169f2d9c3da1832e20f9b3b7b8ab855a8c298b156b"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.7/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "491d3b0b318225ce3aff66cc74b128626645718c5a3ae5c4e1d097f897045607"
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
