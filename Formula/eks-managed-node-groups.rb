class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.6.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "aa183949d075c687862791de2d1f2cae5a03ba36d5d6752a42d0c99ef71c73d8"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.6.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "4883562182db9db5d15eafed365766ad975a5ffe3dfa22fdae28167cbf6d1c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.6.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "9fa87510d7ed5c225b9d50b211ad8b2a641772feffa3dab7dde11d3bdee6d441"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.6.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "7671a0e90fe29e53f7001aa304e6284b82a9c9bd1fb428e4e596b7d2c5fe129b"
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
