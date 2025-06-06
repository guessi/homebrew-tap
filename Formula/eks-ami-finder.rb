class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "9e4d35a3a115c94823454e8fec6f3483cf7133ca1a298a76025ecd8e70bc8fc5"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "09ef463727b2cdad35cabe3fa3ddcf98cbd44633c5e6b15cc0e3e7101eb9dae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "09e207ddbb142299597b0128d60e95bef37391b05d2dd5b5a97d5595a2507c28"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "e28d5d43861cce96efc11abe6c32b7896a5820ab2766ce24aaa005d15b30df56"
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
