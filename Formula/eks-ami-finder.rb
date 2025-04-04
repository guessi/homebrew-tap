class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.20/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "bc07225c13404e2b360093c3b624c64b67704422f11a641db1d18d137cba68df"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.20/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "754dfa90ebdfb8cbe05b693c4254be640f8c696ea4723f5869c0fe214395ce5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.20/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "36a60c5c9713bcaab0c14478c588c2a4f6c90a73e22c396b690acea1aabf6c25"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.20/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "75c6cbbae748a9ef257f1808a843cb312d6309eb96782f93db4c46ffc1b7d9c5"
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
