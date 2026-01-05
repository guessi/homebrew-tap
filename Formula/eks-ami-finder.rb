class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.10.0/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "4af2382c0b6276af28b963bd4653e65d96945a3d2e1994e5a13814e18006107a"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.10.0/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "737ace9491f34d53dc3fdb177fc26c4e3c4ffcbaff60ed7bb31950e737703125"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.10.0/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "4f9d62f981731c784b539f4ab9c2392bf5857991fe3865a0e3d910836edbe001"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.10.0/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "00e5bbb876f2ddc58f9f39356e853bad1377a2933c8a3c270217062d3dae4e8e"
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
