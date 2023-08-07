class CloudtrailCli < Formula
  desc "Blazing fast single purpose cli for CloudTrail log filtering"
  homepage "https://github.com/guessi/cloudtrail-cli"
  version "1.0.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.4/cloudtrail-cli-Darwin-arm64.tar.gz"
      sha256 "1517c9b1f59808805186e7dbd02061cd5d2cb281e80701bba7b86a19d1262d8e"
    end
    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.4/cloudtrail-cli-Darwin-x86_64.tar.gz"
      sha256 "c59de359fb55664d103cbfd7792a948b796f13b1362633f3c8f62e4a86ce9ce1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.4/cloudtrail-cli-Linux-arm64.tar.gz"
      sha256 "98db0426d907e767387f5cfbd9b6e1fa32765bf58cfdc8659cd69349f01230d7"
    end

    on_intel do
      url "https://github.com/guessi/cloudtrail-cli/releases/download/v1.0.4/cloudtrail-cli-Linux-x86_64.tar.gz"
      sha256 "dffed2dd5ee7d829765eb8f72773108052a944cf271a13f3bb284b8648b49a6d"
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
