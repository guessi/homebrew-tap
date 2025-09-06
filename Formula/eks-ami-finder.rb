class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.4.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "122a1118472d4748a13f4591875f2e57591282558a24cebca9707f913f7d9f58"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.4.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "84d3213c3123d4b9943deedb838e33a8b6f5f49d7b8e51debd2b9ab1f2eccc10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.4.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "308e8205f678df3478275d4a4eb1561a36551cc4c22bdaac2201e66ee3644334"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.4.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "58dc586aa46845cbf4bbc02141e9a87672b6f1cbf7c61032014d3470efd0f099"
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
