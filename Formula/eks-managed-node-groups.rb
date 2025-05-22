class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.9/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "c8b24f1364178b8100b02222d27634c161846ded029929bf0e7a08c9dc235478"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.9/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "b55b9ebf2bab59cc197128f303c7f4a944e4314fd24ca3f632de4e9f304a65ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.9/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "6536e34fd0e352aeecbb5508015ed1086fa0943369854f4bc813eb0dbdeb40d4"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.9/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "7ee238b3f39eedd8c894edf74e1a91bed4e8d094cbe40be88bb265e8ab0bbbbf"
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
