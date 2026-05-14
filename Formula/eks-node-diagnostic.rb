class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.10.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "fbb9a515b658a8362c1f9f008b2abedd8980f7dd3e225cc7b751800f90b9b871"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.10.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "1a4b3e05b990c860e0780f5db053375c571eeb101452a8f4bba3d1fbb9269241"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.10.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "0849b2d236334b502750d5209ad125e8d5ac712e435cd8c866ab3c92fc519d1f"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.10.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "10d4118247dd90afff9a6ccfc352f75825723ef95b8c13467830cf05d32612ed"
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
