class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.18/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "17d01435fd18e37544d9babf154a4f4f76cc54fceacbbb320b51829c629cff24"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.18/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "1923f4b84981f6199dd0d70674b17eb8550deb4e9ff8f59998ccffaf055cf575"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.18/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "19401248e70610f4e2571cd2372d61a847236c9c18fcc5957695352f5d92d066"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.18/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "8bbec5ca41d8751c83b09caf37f2dc9b1a43a6bc3d1865bc25910b8f93c94b4f"
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
