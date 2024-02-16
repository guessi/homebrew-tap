class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.9/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "11e6a02533f370a09214e6385bb59c3969c22229b9ac2ccd757371d3cf59caac"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.9/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "cfb51b1c78e67876bf6978d2eccfdc9afe52ebc33b3297a3d18bd6414b9f0afe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.9/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "0b8a6b03743d79b6e1e4e32e39661d12f6b08caa66248c7d8623ca361ffad4df"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.9/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "8b86632102155d6f7e01f7ae8baf635511c835261b7d038a81ee097a26243d05"
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
