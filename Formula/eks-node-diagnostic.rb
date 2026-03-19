class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "496d1b7f1afa6b2cf5c96a9de36cbef5cb4b9bb66c1297ff45a7916bf64683fd"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "f58423c879f2e179ab27673d37e53a6ecfe7927c7322cf401a99aae986ca6ed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "1702a1dfcf55663e96dac7b59daed5d725167533d419dc97c139e2ea78fbed80"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "c889e5aa3a038d3897a20e7c0410d1404fb87919b67c42567cd25f638fc92d8f"
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
