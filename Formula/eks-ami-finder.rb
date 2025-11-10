class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.7.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "cb57421f08ab4a1f1a4ba8db1a73e4306843938f11bb616e478dcb1089b45965"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.7.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "bada3d1b37bddad6d937dcf512c3a16af5455e18defc134df2f84f96abd0c40d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.7.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "c8860a0f41d5fb4f288c138e172419dbd3238585621a9871faf0d7e0b50f88e0"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.7.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "818c4df17cf3396309009ced35ce6e0a4999dddb9647164214232ba81d6f7480"
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
