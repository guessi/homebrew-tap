class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.9.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "0ea03263931591e5be2a98bbabf98dceb1aa8e35e230e88f5f8347b83f10f52d"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.9.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "768b68af0d73f873b31e542557cc07f0df5e675351934f6bb0a0dd81748861f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.9.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "c7772f090b1f005bca74b41751073f4d703a20cdc2d5935e3aad2257a4672cb9"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.9.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "ca8ca7d7c9c45bdf07e329c71bc76b795fc01fe7c5487588f4195db8e9819ff8"
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
