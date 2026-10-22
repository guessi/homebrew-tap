class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.18.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "dcf66ad3f94aa26b4ae651c2ed65cd75485d297a3e59901a5e0e9d7c287a26b1"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.18.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "c1083a7e129eb4ecb4da6a2f48718530df37696cf4cbbc6d00322e35044bbf01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.18.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "c6668fe71a393b03c9cf58005f47f6d010faf474b3255a1853dac923d4c67d69"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.18.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "45745804167abe84d85804e95e2f10428a0bdc51419598da1df9cfd891355281"
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
    assert_match "eks-ami-finder version v#{version}", output
  end
end
