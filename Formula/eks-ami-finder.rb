class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.8/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "44f01320fe8d478b0cb64d60e5e3a3eea8c661b09cfd7a493698834903ee23af"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.8/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "9b2b283910d498f69cca8c6552ff04f9a6233f2784266edc8fd0632e76aef5df"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.8/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "a25069c1f53eaefde4ced043e41a3e43ee53a15dda6fa8e8df878a95ec18c1f6"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.8/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "e23c2e8ebaf0feb390205ae4d23d41d040b7c8c494cdba07d506470c9bb33ae7"
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
