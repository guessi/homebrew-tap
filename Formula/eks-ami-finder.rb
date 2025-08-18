class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.1/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "3b85d8c7b4160bf4627d41aaa9e5a37870b45c9699be10d8e92cebbd5da0ddb4"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.1/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "34e1a0295f7ffc85432b255659d75e1fa885b36f7bf4dbdebebafe530ee66a87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.1/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "6b3936b1048f02b37a23610c72d7bb752d508a32f857eb8c606fae82fc191e0c"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.3.1/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "d80ebf08baa6eaa96f29a16171fb381c3b39655665290bc26365ef124654e7db"
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
