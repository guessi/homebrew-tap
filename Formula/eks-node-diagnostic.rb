class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.1/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "5d4056d92d4dcade8f6866d05c1184e781441ff1095e860993be7448c393008e"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.1/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "fa871c158a9be769a9287f37f14a7d7837db48233778047b2bce601d44849ee7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.1/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "f6c88246e983e497a9c9352fc0d360b16c8258eea48046e3767ae75a4acd6ea4"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.1.1/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "c73977df977e8a32bb10f8ce629415c1bfd0756dea7861bb7e0e914f6a096356"
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
