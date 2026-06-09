class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.11.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "dee601a479e339bd3f4d28ca60056eef354fbd4e0e7b07c1c5ae2f5a28fde7e6"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.11.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "209297e2493abdcd32dfb708692c56e8c5da7682502b8e906416ded744470553"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.11.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "9ae102eb4dbb7ce1e268178fc8ffdb791b52e79d81c05a78f5ac2033f43d6edf"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.11.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "fba4a2e3c3077299c64db4205e672f4c7c0c2417a831174735bbb820601dc352"
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
