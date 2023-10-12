class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.4/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "1edd5fe3bddd4cc35308ea12c538ae810146c1f5dcf8299f1d6ab18ea26f2a62"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.4/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "8e096c3f438c563762161feae0be73153147236c8a1b4492265b3d254b9631b3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.4/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "86e25989962e4d0082933aeea509fc4ebac42204d91aa44c249cdfe07efa5d18"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.4/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "5d7aa7fad66e0b9ca12af4c3b6abf6b0c2791c08f9809dc60e9d9d42ca7d00c6"
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
