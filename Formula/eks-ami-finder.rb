class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.8.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "be2a6015b3d98941eca47e3092e07d1b5aff1e485d671f3a7a51743e2d517165"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.8.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "c66dde38485076c899b3e6bf967dceed576eb15b15d899c054e5041aa2fcc14f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.8.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "ec31b3d7c08f07032bfe4251f2249e9769c7213887ad9d4ee3141794e8a0e521"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.8.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "03101422b2750fd6b611f7964178ae8fce446ec6b50ae512fb7b9247e5d90e84"
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
