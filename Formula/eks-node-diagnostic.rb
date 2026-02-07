class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.8.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "6ba97332396020295e5f859d9016ef4f7e6354eeb2dceb71c26e8358d65a00cd"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.8.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "3e5189ba98b80665fe54de6b6f558ee7faec76f676bf7f6fdd36957d14c30eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.8.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "3a8f598707a24eb4c8470ce5ad6592603fbec3b393afc3d7f4e5b0bcecf655df"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.8.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "74e943206027c868937f0c653c70e63307aac3ebfa6c5d8822d2f3229dee9377"
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
