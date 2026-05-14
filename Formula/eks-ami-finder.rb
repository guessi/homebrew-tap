class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.14.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "3fa2baf85b33c92166c997973b7defb6b28a81ad9bc7e22217519ba23d9d0c4f"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.14.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "552b3b4d34e17d31c6e471f9f6c8c2b56be9c5c479497457440d24cb9543a9db"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.14.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "508b06bc50768676693cd1f77a9a3f12dd5386e84d73b4080e190900c84d9e3f"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.14.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "5b771633934063c712ad88b13824616d349d97201d81fd7dad2a06ff06f7395f"
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
