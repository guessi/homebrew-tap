class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.9.0/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "cd542819c64516a212ad3e5cd333f3890184fe1db70dc91f725934b40f823c04"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.9.0/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "412c184872abd172a6d38643092794a84b9e22760387945b4bab64ee05665690"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.9.0/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "ef26642d456778aae1fa06d0aaaa93460fc81a823bd1bdd91c0f892ac2c25ac6"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.9.0/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "5ee547a8afb34f87bf80279e6ef7ff8a31d719c0c7aeaeea5c6fba27afbba3da"
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
