class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.5.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "df99179c3a3ef752a012c16ce58c69b2a5babf5e5dd27c4dda3b495e62afbc7c"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.5.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "ea4b7f2ecaed24e3f6ce6985d07e645ad1135bb21b1a3811dd66061c834fa436"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.5.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "95ea7906aa4fccaaa55cdcdc14c0ba94796aa31fbf0502cc0f7d393a54df88c8"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.5.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "d7e37f233a01d9387a4f7479f2dade015bacaa75d0c9df12d29efd443967bc39"
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
