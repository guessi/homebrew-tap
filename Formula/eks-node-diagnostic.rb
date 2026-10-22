class EksNodeDiagnostic < Formula
  desc "Friendly NodeDiagnostic generator with no Python/SDK required"
  homepage "https://github.com/guessi/eks-node-diagnostic"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.14.0/eks-node-diagnostic-Darwin-arm64.tar.gz"
      sha256 "9d274c517e377b928034c40b16aa3665fe062191d9214d2d4ba91913c01f9455"
    end
    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.14.0/eks-node-diagnostic-Darwin-x86_64.tar.gz"
      sha256 "18a77dae96c5a02dad38766dffa053f308a2aabdbfd232eea41c1ab48efa755c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.14.0/eks-node-diagnostic-Linux-arm64.tar.gz"
      sha256 "b46ae890fb622404e2898adee51c6aa02e1c7c5893a2d1caf226241be90ee797"
    end

    on_intel do
      url "https://github.com/guessi/eks-node-diagnostic/releases/download/v1.14.0/eks-node-diagnostic-Linux-x86_64.tar.gz"
      sha256 "5cadbcbb545ef9f0a3109b784c3b8a61921705b459c1b6ea2d2b29ea5ef5dce3"
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
