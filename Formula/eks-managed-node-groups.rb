class EksManagedNodeGroups < Formula
  desc "managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "996767c669cb9efce77a3823ce159cdf4c2ffc742b75a1751d4131fb5053e378"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "8c98d2431aff7e89a5b11abb7e7598fccb760c90a9866e37c230e2e9849ee9f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "85aa5f4c67a86c59f83e782ff3e4310c8ecac6d1d96a295e218f2626e7c67440"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "f05bb8853845380a47280199bc2f77cfdc871c6b582bacb284764af2bc5f6710"
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
