class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  version "1.4.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.2/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "4b917147469bb8dec543c27bb53be0da4f28250a1c414e62654e81679102003e"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.2/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "43f6694d9afb69ff3dfe99f7c946c0201f97c38387e5a862612bb9ac7f7f0d1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.2/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "b4ef23478e1f331ecc26a9235e05617ceb48e0169ad3ca3ec0e8b52f4e71ea91"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.4.2/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "3c6d88db9dce33392a7ea0f254795b9d6d2ee54217315843924ba5ef643185af"
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
