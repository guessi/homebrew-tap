class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.21/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "28a365add8fd85f15e6aadb973de4b748c0e336a4ee25b8256297ecfa60107e6"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.21/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "11a5a713dec8dcd8861888402ed5b430d33c0498e795da3829349b01eac36bbb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.21/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "a7a114af85a18e4090c97afd261fdec5eb1e936a8ae5512570e7e7d9250dc281"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.21/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "1ad982dc774830cf639df162ec3306fdd58b3ff424e42d7941aec6851b972751"
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
