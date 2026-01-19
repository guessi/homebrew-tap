class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.11.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "c5375813d2e6776fad2ee72221bd6f216cfc6ee6e48d1bd6a71c1c505e6c41df"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.11.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "6e76821bec628072655cb9bc28ec136365a1b4ce7381d03c7448c550d4a48907"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.11.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "308f2e48420069ac1446b32262a349aff0dbf043c72e314322640d674148322b"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.11.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "2bf81a01b0c0eb8ebdcaf1c7616233b59d748b822f00e1e1ff325e54d077f1f9"
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
