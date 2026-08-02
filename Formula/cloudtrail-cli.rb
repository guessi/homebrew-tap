class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.8.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "0c36c28f1c1d927cdc51c1c23393f267c5912b6016b86eb6a32d31e393eaf82e"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.8.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "0aa498ea2332981b0197ae7c4fda6c342bab538ef885c0ea8ed7e744b94ea695"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.8.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "dd8453c19f30ee90d858176dc4301f27d8d19aff3fb08539ade271b9ae6efc96"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.8.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "5d1aa209b1265aa977c944ce54779c4db31cfb1f4cb8e931e76ed80d5ad5d8f7"
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
    assert_match "cloudtrail-cli version v#{version}", output
  end
end
