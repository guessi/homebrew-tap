class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.17/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "77ed038d8beea4023e78905cba0f18f19711fd364408a72957447c35f06ef888"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.17/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "601ccd33e272eb4774411617d2137bc4443c8178d890fd65b2b04f5539de2c07"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.17/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "6033495732fc5d0a2eaa9b6e89b3f9565b1a575d5df6a94d45c82db88f6645ec"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.17/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "424b8d39ac2bf2eacba1648bc0090d525360d6c2fc3d003635a6f073b70511ca"
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
