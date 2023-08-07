class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.2/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "156e9cf8abfd4bc93e7fe6962eb6fb1a798f1c13be866671fdaff61d3ecbc28e"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.2/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "ccc562cdf05df6fa81365ad952e8d4d599f0bcb2b8a44a9d5eff39824829c3eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.2/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "fe860d21b68341584f6157b1f09f3419b9ff4ffd7b2a069f8184e841c0f2d3c2"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.2/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "bb8a9a7329684c94640b3c36415e80ee5cc47b3c96cc0245797df6c8500d84dc"
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
