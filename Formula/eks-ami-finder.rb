class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.3/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "04051917241c7d5f1ed5391013d630e0d23f6e5431506f30d8d501bd7d2a60e6"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.3/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "2864b86818d9416fc7f0ee19aa1a6cafc31c5b798889562d52aa9fb69c1b16a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.3/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "8a9f6ce5f3b2d5e3fd55e183a58bbea52b957c6908d47c88870160659604f24d"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.3/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "c510c00e23b4f3872b3a084df3bd34726b26dff22b68bdbad6f179556db5c7fe"
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
