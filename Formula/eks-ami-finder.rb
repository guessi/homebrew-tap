class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.5.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "561bdaaf152ea432b646553129146b3f3372fea159862be1bbad586461f4114e"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.5.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "005d0fb576bc3cb708b04e1e450fbe8e38ee4ae990c0c6b75c08452e7f8112dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.5.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "66b3d99b295e76ef68dec8e031dd77f4966bffde2b4b455a1358d47e6ebd8f03"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.5.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "8501b405549f7dc020cd5499c11ad3e73152cc49c56fb7a40861fdcdb463de2f"
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
