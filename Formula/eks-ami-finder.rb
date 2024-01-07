class EksAmiFinder < Formula
  desc "Retrieve Amazon EKS AMI with filters"
  homepage "https://github.com/guessi/eks-ami-finder"
  version "1.0.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.6/eks-ami-finder-Darwin-arm64.tar.gz"
      sha256 "93aad4c237d5c87f8c6bfabce7c794ec96f24a50deb24597857e588bc88b2b5b"
    end
    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.6/eks-ami-finder-Darwin-x86_64.tar.gz"
      sha256 "b406b44ec0670bf3d3675a5e3637f36ca2333680ea92ec986853d0a7eb8339fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.6/eks-ami-finder-Linux-arm64.tar.gz"
      sha256 "5bcbdfdc12b4fafb9d6b61cc41205159629491b6c5afb421734e1ed4a2fbbfb3"
    end

    on_intel do
      url "https://github.com/guessi/eks-ami-finder/releases/download/v1.0.6/eks-ami-finder-Linux-x86_64.tar.gz"
      sha256 "042ea23e6e6dba30beb2e269a9a823acd5f7f72a7e5157aed2d61d18f01257a2"
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
