class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.1.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "a69a639e687ddeb5860aa6562f2f389eeb34fa70d93cc2a63e682ca416241a1c"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.1.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "bb2d65c06543f808d3859b58c9807c4c855432b1bdf7ba3ee28226b09305ded7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.1.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "9e7147e43efca4c7b9f2213aaef43319ba11f13f60acb9075034d1475353a2a6"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.1.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "5feb713cdfa642cf739fff5b348c4525b5abc0843cb4b9cc565aff4906177e05"
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
