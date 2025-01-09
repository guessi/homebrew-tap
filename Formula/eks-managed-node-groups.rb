class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.5/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "49764a4c8422cd6359a54fd5047da6a24af92fbb01723a6659d208004ccb443d"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.5/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "b7aa7989625ba46374367eeecb92817bee5e880d1569a2a0faf98c3fa247a9f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.5/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "59f974cfef523983536c1aa93ccebd76f7eef49b9a24c027398d23ff6266856e"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.5/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "dc54f1eaba1373565c755964112f26872aae3472a1ddc173d535bb5acfd0f968"
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
