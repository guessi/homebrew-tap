class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "f499f2b39f07e78c6b333dc718174a0633ea8bee1ff98725ea63d2d6c022c2fc"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "8018a1ab93db7fb514fdbce858ceddf6488f06e32a6219288f29515cb167d6b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "75c05833092577ef942ffcfce0301d51accccfe9201158dfa60874a507d91e73"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "8aa4d796e819421d3e58f5a7b25a728f680a8a86b61712962d57e1d15fe4a8b1"
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
