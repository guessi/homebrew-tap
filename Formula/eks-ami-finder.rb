class EksAmiFinder < Formula
  desc "retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.1/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "def91bd6c62b183da583d5ad8b06f96d9a1c6949addde3be0db4052e16c2b1cf"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.1/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "6ebfab3a2b562e76e3c9b177a9e42166c2fa62cfdb3fd09ee81737aac0df9009"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.1/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "ccb0f9c177e66dd59353028cbfd7be835aeca4c04c84746d7f402efc3d0b7a97"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.1/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "95a696768b8e8cba99aee004dabb3bc6ab8ddb039a06219039dec86b7b8e4268"
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
