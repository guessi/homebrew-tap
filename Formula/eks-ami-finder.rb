class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.16.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.16.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "4253c4bb248a25eaa298b25380e6a4a0811b85121ad378bed2641240cae93b0d"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.16.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "25122ab2ba7c46c8b49a293c4b1c354c97dd908be8c0c5aac1e87b883293be8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.16.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "0b0d937debd91324b7999a87e969d94b29d984c78b28b4d386ceda59f5283d7a"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.16.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "9c036510f6036ccb0c5509749f138ad2a1b86bda931d19c25c540df5f6fada97"
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
