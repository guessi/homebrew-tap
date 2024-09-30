class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.16/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "29d33aa0255dfa06c324de03d80962bbdd34bf711f52aeac18b6e76727cdc0d3"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.16/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "422b64e790104c7be42f62c434f9bcd05ba3cbfc21857252a1b737b2f3d90c4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.16/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "fce0d7785a6b1542e9134338f05e022c5a8b329cdd1c8e510de79fb8f3ea657d"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.16/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "066ac84712fb5e58cf89b6b50d349b8ca8298573f2d4c217d4fa0b17ec898731"
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
