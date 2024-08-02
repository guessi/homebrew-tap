class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.13/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "f88944988cfb8f19bf9e558465c204449b8ffca1543d27241777e0ababfd0664"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.13/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "6e5244a6bd9f1dbd9202d82bb4738e3e1ff49015e31c9e391c8e969e4e797994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.13/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "9f6a1dc91ecb809feea4c17d2d1db663466a3743c2268f540fc4b7d215e58786"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.13/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "b9aa142f0900a367bb5617ba3fc0e2052042cc1cc4ce65f0f39266d2445faca2"
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
