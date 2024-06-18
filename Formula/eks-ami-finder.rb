class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.12/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "e09cadfa2ee10e2f523dac7487a99fd313fe8e8347579e3261c804b7f562fc07"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.12/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "59cfefbb4efcfdc53da0ecf2b4fe55cb431237786ba023d12a83b0499b8ddf96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.12/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "5fe9c91f1573f4eafd128f09779535caef7cfc9baf566f12ab0725b63d3d3c28"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.12/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "7d6bd6e9483c04e52743bf3426310de2326fbdfda8ca05778cdb49a6de81e890"
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
