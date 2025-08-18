class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.11/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "286397be176af429d4152f6b3a6d7cf798720739af37705d7111270272f3c1eb"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.11/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "5db6c324df1abc0b9e530904e80a9ae3f2ed4127c8729fdea535fb1d4811d906"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.11/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "e98b441ea6b32d0c6a683ef09c5de15c26df8af5bccb55285d472b5c8304a614"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.11/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "d0e05147247286eab48595da74c713bd2134a2524ca3399581a061ff9fb151ff"
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
