class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.2/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "6effeef1cd1e3d7f88dc9d49bccd358e2877352a084d15b00c00e65be0156866"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.2/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "785471aa4a7470861fb76e413e3f1c803ed884f2bbb03ad5d068366a935ff5c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.2/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "698a4fa486b51861d81d1a9e33c8066e6ae23fd6a56e704f0a83ef18b3bba6aa"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.2.2/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "db171a58b1de4d40d3610e6523d58ad860c795e2be37b396944ba386cb107e8a"
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
