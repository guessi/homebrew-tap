class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.7/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "5cebbbc558ac6361d5b8ded28693da6fb8435dfcd25334d2690cb7dc1616077d"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.7/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "8bdd07479fe9aa775937b3be09a1d5e44b39d9053bb77dd4ad1fd3cbef32e793"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.7/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "3af60a401a152db0822d6f0024dc0650cc2ce12b10db63645818cae4a8f0b313"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.7/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "536201a33439881f390145c086c1317ce65815b395e874fd180b34f7fe23a491"
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
