class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.13/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "1302b85f542442b19a1cc1cd0bbe52439162169e838e442130f08ba8bf89054f"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.13/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "5b461639775595cd2241a3d419f50dbdeab4d7ec40ff0e919e0e762f9fa0b8cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.13/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "35e645545d7ef5a5689117f28ed8b9288e1ae58991f3143834cddd44f0ad91eb"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.13/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "d84426e88e3dd8f3c6dbfc04d30aac2e95dd29c40fc3a58c87abbabf38e232bb"
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
