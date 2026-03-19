class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.9.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.1/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "e57ff67d630ef3c8c1cb2200505ebabcac91a8993c324f8e1cbff08592fc223a"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.1/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "f49041ed533ee8f9480d1b2906d0f7309261a5ce846926adb7c8b129ee59e704"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.1/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "917653e70608bf7c6d894a5a0613cd29d9f03ba917ceca9f2babcf3f19e80575"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.9.1/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "87760c70ddf8eda8b1ebe3f892800bbb2ed20a52e807c12c4a7168be9453f8da"
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
