class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.15.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.15.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "54d58d6927a198ed638db544eacac88314a0f72eac8f9e9895a3c1c41f24d0d5"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.15.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "0abac14e596404382e48a36efffbf71b8fd369cae377e7e3aad1169d0c05bee9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.15.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "46804aad8f57bf1867d74f01efecbd8a26f02d4697699749cd460b3194ee8282"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.15.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "19ff3c48f8b1efb8760d276c9dcc5d46a0cffb93760a7491efc31657b14813b4"
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
