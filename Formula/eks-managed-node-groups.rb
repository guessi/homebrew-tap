class EksManagedNodeGroups < Formula
  desc "Managed Amazon EKS node group made easy"
  homepage "https://github.com/guessi/eks-managed-node-groups"
  version "1.0.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.10/eks-managed-node-groups-Darwin-arm64.tar.gz"
      sha256 "684becd950b5266818dacfb2b4a6237b0539e58ee00413f52c4124bf0fb85b81"
    end
    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.10/eks-managed-node-groups-Darwin-x86_64.tar.gz"
      sha256 "2e9e15ec3a6c04824099ec78953880fcd01b5c6474ba3aa96c0855ebe5decc24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.10/eks-managed-node-groups-Linux-arm64.tar.gz"
      sha256 "de56efaa83feebaf0e4fa6bec42454a1edcee633edad2c87bf3ab8e568796d71"
    end

    on_intel do
      url "https://github.com/guessi/eks-managed-node-groups/releases/download/v1.0.10/eks-managed-node-groups-Linux-x86_64.tar.gz"
      sha256 "ac8625b1a80e75fbabf6e1d559e1b3603dceeab7fac612b4ae0bf596d1e9866f"
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
