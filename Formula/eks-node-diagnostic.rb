class EksNodeDiagnostic < Formula
  desc " Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.0.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "4af509cd73af89a44692b02c53cb5a74f3853df7f855b854aa2fa6e28020cc9e"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.0.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "fe77cc21d66c98535b3dcda976c07858b3a977257f9085ba99cead957ef3de50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.0.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "d93d33a3483dc3b2e59be6542110f9e17946eb298e2681538c0c4fa84d7cbf2d"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.0.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "19ee095cbc676744fcbe7b14435755c50893f076d5294e71b03432bdf10ea520"
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
