class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.6.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "dd4ec5769d8d89cba40f9e2b61721e5cd6c7541247b526d2df0504cb18f4e566"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.6.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "57e06712ef8e2a58bc831e08381dcbd8956dcfb6fb521bc4e3224043d838230d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.6.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "f280127d721a33657c308346bb48b84972bfd8f264c27cfb7f4edee55bda2a9e"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.6.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "d1a67d72cc7270555e33c9e02adfde08b801ac7f0368a868a9a45360a55236a4"
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
