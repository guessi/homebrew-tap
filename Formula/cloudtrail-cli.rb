class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.17/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "b0ca05958302a942c4e02413622a28c737dcb8160edce32205431d276b130b3e"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.17/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "827f6d8a24a8eeba072aa86a0bda7b7a4bc3bbf3742ec76e52dadf7145f550ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.17/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "a7c5f16e80f2e4eec7ee490eb4021515f14365b5039536050478313dfd397b86"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.17/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "84b1910fa5335f4c0fc9ca998ae3ad57a29353efe62fb746029054951cdd300e"
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
