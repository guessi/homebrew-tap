class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "77ef7cb15400fbd7640a7057275e1214d900601d5455aac9a03b59b2142b3bd9"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "0060ee9475a6f8527481345b87049ce5ae136d2304ec9e741ee87ba6cb72afad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "5b1ce6e11ff42e6f25af125ba74abade59bf94886dc6fa52bd1caea9af23917e"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "55c15e1f70808d1349cd6f247755aac2914a587a8ed6eea258489276803be31f"
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
