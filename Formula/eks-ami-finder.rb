class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.22"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.22/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "6754275a704c632fb653d874135eb1b0834169ecdc9e64666953eab71b8c664b"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.22/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "0a978789f0d34ca3f36e843f0d5dc021c2e7021f53cdc63b6300d4c8937c1e0f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.22/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "5fd2be8ce81ee0ad1b22487054f2c52be780ba2eb3db6b2116c23f818bf8b17f"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.22/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "f663b30fc7bd5820635c3577726da1977c9b84c7d6cd47e505398140044092c9"
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
