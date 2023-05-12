class EksAmiFinder < Formula
  desc "retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "1eb70e1b5d2abf70af60da7d9cdf7a9d6f840be0c5c28c4d6f28ed60c03a7411"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "14763b687c67b1d0b4a4245107bbb842d0fba45c2313f266b4de5b2eae9c42b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "ef4d08efdd67e1581d41b69e67be8e4687a851b493b4d902fdfdb9c6851e9631"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "9a0f9e73979893f75da04eec926e875ec80da38f0645debefd8d982227176d93"
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
