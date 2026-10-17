class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.13.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "111d4ed8228c1796d48602f4b1dbe9546487de9b8e36fa9073d926f02e5b98a1"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.13.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "45e1f9b6e1cdd6d1d0bf07af636608c60162a123355a37da3d1704ef24026542"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.13.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "26744752ed0954fd20b898fc14ee760aafddba1e47e261a3d1a015d3e268bf04"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.13.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "ba2e65b46bf4cdb668c97a3fa92b06def1699ce6cadba83608ff91ec72d50d40"
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
    assert_match "eks-node-diagnostic version v#{version}", output
  end
end
