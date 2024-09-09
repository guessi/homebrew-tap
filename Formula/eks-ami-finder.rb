class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.15/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "9d039e834b36da4b3195ba6356f7c2eb6097dc2dedba4eca8cebf5dbd79ef85a"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.15/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "db8ef9c5baa64869580b9351d8f0aa79c2f7a86c5ee8021b8f31620f66824684"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.15/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "47925ea05e958d9643fa87e7f2e647637c92fd4c386cdbdbbdcb3de42eb9a4f1"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.15/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "be24575603bad28ca0b52abf9554d6fd68c7e0aa0b9a3005c44f28accb5c6893"
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
