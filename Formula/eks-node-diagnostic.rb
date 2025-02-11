class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.2.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "07efa5a30b1023bf697f3a6dbb7225f024a426945598a9e77670007adde32c15"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.2.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "a87785b11443b55050590513ac689bd9c3e341bedd0d26cce0f22cbb9e80fc8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.2.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "5e62d84207a5bfa0d1c5b2ec9374bbcc2c6b0362486f15a380cd98381f2c0520"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.2.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "8fbbbdf75a923b9180ba094dc3a3ccf283f038a680729d83d1d4694c3ba9447a"
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
