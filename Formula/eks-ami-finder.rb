class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.10/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "13848959044baa445ebcdd66bd778648e2863af5fec69917908f98ca768e1bcb"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.10/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "5149f0e1aed05878a9a8ad66eab76319983f836be2e1288fbd4f9cea08d5f570"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.10/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "ba162f4b38c339894629ad2e8a33c85409d924cece473845de0730b73906a6dc"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.10/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "221f88e6d3de97de79e226bbcea19bf22e89ccccce29636444463724a5db5098"
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
