class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.11/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "f8c4b2575c1b75e1c63c86cf7ec353b444bc7adbf35bb324d505ef14cbd8a985"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.11/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "b38286324539b72170530ad83d7c560fbdfca4821f0cb7555bec9a9ae1b976da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.11/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "97fc0bcbebbf1d4a9f17d8910b9dab8d1c5f50884d37fbd096c0a90fcacbd7f6"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.11/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "fffcfca22d4aba53c988d714aa487d8e338628b33ae49d58f71f27c7b86447ba"
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
