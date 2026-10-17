class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.8.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "ef9c935a7ed5448714e668c94ddc3fadd057edca5d1ab7ff9318fe61d0ea52ad"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.8.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "167dbd641569a43953a312fc3ef8bd274836362ac82eccdd17241a9ebbd36d3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.8.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "d033c6f741a028bebb3f8f51687264c60d0722d84eb7e5a44dcf3a60bf121f58"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.8.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "3687e47d16285f743d378b4049c37fbcc55e91a41eea8aa804816a88ee988683"
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
