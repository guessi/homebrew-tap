class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.11/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "b9841f7e3249cd50975b6fd7f18ce6cb304eb60f345f7ba5404a5d5104a4ed65"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.11/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "61c4062e8c42d09de7fc5b8fec8d18550f634aaa92f06ed24baec2000fcd376d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.11/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "be709cec9e6533fb39125e330b2abdb0ae9f75264b555d1a4e91ec711dc25ca0"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.11/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "9af8f7c039ca829a0071ceead1232830b7e5b781ae58f5be98a04f4d8e31cf1f"
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
