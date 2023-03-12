class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.0/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "b88f6f787781b85fbc9fee2c9303a77df51e45c142be1b043a027c0c143e4cde"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.0/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "aae9c62f57ad9188a1c07ecab4c606e4d72fe421a6dfbc7a795366e8990c0636"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.0/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "cbcd527df5d7090502652e84a471850811b849c4a691ae6d0d1150f96e1b6193"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.0/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "6ad67ff7d498a12ba54d4317877b752d18221c736fd099997714b8a715c509e8"
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
