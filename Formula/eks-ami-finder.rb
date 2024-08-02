class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.14/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "01c2f498978833dc634eea19645102658b009436a37c91a95402017da2a0300c"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.14/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "67c5e09205f5592c002ec8daf7daf80d07176d58b0b3e9e9ab9ba55135f95031"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.14/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "c45debe1dcfbe840362877570c8f13b18e596c7e3915c6cdbbbb5474540b1579"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.14/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "dae296a64f52ad8eced6892e5b8c679b21a5a2d32160717d61566c88c1a3e99b"
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
