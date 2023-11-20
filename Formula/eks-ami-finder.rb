class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.5/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "d3c84e355dbf7ee2e9eaf70ae699aa17ce784d5eb727b3bce476b0f8792051d7"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.5/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "a3e9a77e713685cf0965d1f505d7627bc4bb4135028e352eb9b4e347f6fc57ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.5/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "1a8466eba92a0643295e6092dd58c8695d40bb0309ad21127dcd9158319c6794"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.5/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "46e4ac9ace9d2fdff15d3d2274404d7d15b1f54875184e6e70ce884d2bba8947"
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
