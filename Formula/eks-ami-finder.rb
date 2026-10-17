class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.17.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "191b3403b522dc4fb7e30e1a46508c5b58f4c11ea441c1a0751d464648e9ffde"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.17.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "dd859962671dbcba614bbd0bc7f888e5251bc9565225491628f001ec873e8db0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.17.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "b8f5899e33039761ac1e0731ca8823c4af5ff524997f953009ae7fd6dc45f8b4"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.17.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "b3d00ba2bf6c9eac69f85e485e5389d04dcf9f07ba6b52d0769799aa97e4068d"
    end
  end

  def install
    bin.install "eks-ami-finder"
  end

  def caveats
    <<~EOS
      eks-ami-finder --help
    EOS
  end

  test do
    system "#{bin}/eks-ami-finder", "--version"

    output = shell_output("#{bin}/eks-ami-finder --version")
    assert_match "eks-ami-finder version v#{version}", output
  end
end
