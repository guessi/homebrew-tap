class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.4.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "e0ab3e4bfb7d0528e6aac8c87e56b6a036b6700564698d9367efdf773df848df"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.4.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "57c2113ae4bf502884b2272dc208e1369728bc2ebda15253927b22b649b9dd3c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.4.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "bc0a922b7f7e14ef64d82db2274243bcd6e9e6947de07998694f7f48e1045792"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.4.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "faf9f024566da7575d2e2f6c9891790a30e926ebd68c6935a77cc323956688b2"
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
