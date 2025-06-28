class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.1/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "099662195bbf0afd34bf599955ed0a4cf5302c1668029cedee4bab339588fe0d"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.1/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "7771c5f6e6a4007dde5d303554bd2ddd3625b9935ae04a734b8cdcda7bbf0618"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.1/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "73e99883a4806bbd25886b7e15c4893e843ea2040b8c701a636fdfdef8388ccf"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.1/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "dc411e30311e47668f1dbc8b96054cc45df9223d2df7e9b61db5d17b53274ac7"
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
