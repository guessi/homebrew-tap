class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.19"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.19/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "750f37692f1150af954d7b97d42ee475a738bb826cda2dca01b54d3a1573d80f"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.19/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "a892cdbc58365184859be78f80f8378ab067d29789dfa5f41f348597525e2969"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.19/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "63804bc34ccccf0c0c0466cc4fc90eff9cb399ff469dbd764b3d4bc161202ea5"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.19/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "39df715cb07c534706d9a6d13f0c5dd39206a539b4859b407bcc842ce39c08bf"
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
    assert_match "eks-ami-finder version", output
  end
end
