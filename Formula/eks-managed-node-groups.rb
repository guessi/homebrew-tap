class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.6/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "3fe64739940655a6198914f0e826626aed77b0246f04b18ff90bd620250fbeb6"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.6/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "697c4246010be0762b8fbc5bb0796ea6977903c868ba204fbf253715aa91289a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.6/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "0b22642d9e197a46e8406964a22ce8919437a4032e2f25536537cdce19bc774c"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.6/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "ec3eabd46a50eb05c733334ad14499336974cdca2322d2a4d608a6fa85f14452"
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
