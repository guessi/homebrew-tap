class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.21/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "5a02c2e58f1e6141ee2ec35f0ef0917dc3a25f895af668a259a26cc2ea04a44a"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.21/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "289d53da6b96dec6fb6fe18662a65a71ff125767f3293e8e984bec4aeff427c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.21/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "6485b6d719e11263fe8cfa0622ae039b51dd54648ef5da579b7119e38f326f8f"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.21/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "278d45a270cff5a55d22bed61ca9ceab73524c5900715baaca0a8b71ce7a6f5b"
    end
  end

  def install
    bin.install "cloudtrail-cli"
  end

  def caveats
    <<~EOS
      cloudtrail-cli --help
    EOS
  end

  test do
    system "#{bin}/cloudtrail-cli", "--version"

    output = shell_output("#{bin}/cloudtrail-cli --version")
    assert_match "cloudtrail-cli version", output
  end
end
