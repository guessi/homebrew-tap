class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.13.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.13.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "f915d3ddea30b4f475c8020db1b782e15422d91ef3997cab4924d79daf3dc305"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.13.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "eb8415e9bf2f6af9e0dc87812fcc81b117bd099d4aba97d9d6a2798ce534e9f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.13.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "d19050f4066f923487269150e24c5c93bb9efb0339684ba153684a2c481a8d11"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.13.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "c89de0f841262efa810c49cb977cd5c54048494f4a93ec40e598b4e8db88b008"
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
