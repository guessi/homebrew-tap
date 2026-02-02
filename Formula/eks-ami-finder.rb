class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.12.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "5dd3d5e19f7916ec4ad1e3bf381f0a7948b601e53a8d3d3ade17303dd9d9e1c4"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.12.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "f909944290c80f623b1541f7931a0ed953ddf40db601c533effc5eb80cb2e2f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.12.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "2c50819d55b9d3513c31845a27838bef45009a397e92714013972a9446ea82b6"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.12.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "059a078debdce3a3415c61034bed461991bbf5710851c5669ea23e55b2b2d815"
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
