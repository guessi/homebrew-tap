class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.3.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "3c669041ada0159cf53b50fda7de9a68d3bb47f8e2bf2b60c137820414b7a67b"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.3.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "3a790bb40805b7f3b56a61d41ca4c7af601fd74c435ced59f6a4f5d62ed3509b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.3.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "ffa052691196cb8b4ffb434b535822db1bebd2b29962bd3ef78f73464071d7a5"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.3.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "00d957d4fb41ce95aded2eebf6508b5c3ee4609cec951dffd9ee6c2bb915147a"
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
