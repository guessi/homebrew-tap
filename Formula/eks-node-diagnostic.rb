class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.6.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "f3d249bc3e9e88d8e5da14eca991a50578b2139d0ffbe8c9c73c28d6ad923303"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.6.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "af011f2705bebf3f051f94555a8355b839ecc27c3a8444d5c34501c434066ff0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.6.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "1633af00e15b14db3513cbef8e8381872333e63c57e58809c5df5889e75767a3"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.6.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "dccc8c4a3e18345ee8573dae85fa62beaa253b3a7f861ebe339c9587c9955a1c"
    end
  end

  def install
    bin.install "eks-node-diagnostic"
  end

  def caveats
    <<~EOS
      eks-node-diagnostic --help
    EOS
  end

  test do
    system "#{bin}/eks-node-diagnostic", "--version"

    output = shell_output("#{bin}/eks-node-diagnostic --version")
    assert_match "eks-node-diagnostic version", output
  end
end
