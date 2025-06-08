class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.1/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "f86e65b8e9d3d71f69edd7a1dae49bb9ffedb05f6dc39f8c5d9bece26a3d3443"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.1/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "58a5758d2b00e8b8f354b64649289ecd3d43afdff7bfa254c96fbde36951059d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.1/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "2b386d40a144f5b0b660da051ed98b1b43966fc0f59cccbd86f1304e92a816c9"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.1/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "92c20485a25ced0d67e1b65d16fb4f0dbc4ab3e97c56647a7fbb919a0ab09ab0"
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
