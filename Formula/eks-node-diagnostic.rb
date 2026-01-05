class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.7.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "19156801d5b8ff2b9a2a63ea072f63b851ffb67106c6d554f853a221a36d321f"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.7.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "9b82bc0754009b264f32ec6be192f699acca95ff21ba34c293ae09bbe023e609"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.7.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "55ff892bb5f8d7a257224223d9054d0723d868221b45d228f90fbc1ae38be882"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.7.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "2eeae75e2b7fa64ed6ae1d0f87231189a8c6ddfbf890f051314e238e65b379a9"
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
